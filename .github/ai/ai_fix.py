#!/usr/bin/env python3
import os, sys, argparse, json, textwrap, time
from pathlib import Path
import openai
from github import Github

openai.api_key = os.getenv("OPENAI_API_KEY")
GITHUB_TOKEN = os.getenv("GITHUB_TOKEN")

def read_file(path):
    return Path(path).read_text(encoding='utf-8', errors='ignore')

def build_prompt(repo_name, log_excerpt, file_list):
    prompt = f"""
You are an expert Flutter/Android engineer. Repo: {repo_name}

Build log excerpt:
{log_excerpt}

Top-level files/folders:
{file_list}

Task:
1) Provide a concise diagnosis of the root cause.
2) If possible, propose minimal file edits (exact file path and full file content or diff) to fix the issue (prefer updates to gradle wrapper or build files for Gradle problems).
3) If unsure, give clear next debugging steps.

Return a JSON with keys: cause (string), patch_description (string), files (list of {{path, content}}).
"""
    return prompt

def ask_ai(prompt):
    resp = openai.ChatCompletion.create(
        model="gpt-4o-mini",
        messages=[
            {"role":"system","content":"You are a helpful coding assistant."},
            {"role":"user","content": prompt}
        ],
        max_tokens=1200,
        temperature=0.0,
    )
    return resp['choices'][0]['message']['content']

def create_branch_and_pr(repo_full_name, files_to_commit, title, body):
    gh = Github(GITHUB_TOKEN)
    repo = gh.get_repo(repo_full_name)
    base = repo.get_branch("main")
    new_branch = f"ai-fix-{int(time.time())}"
    repo.create_git_ref(ref=f"refs/heads/{new_branch}", sha=base.commit.sha)

    for f in files_to_commit:
        path = f['path']
        content = f['content']
        try:
            repo.create_file(path, f"AI fix: {title}", content, branch=new_branch)
        except Exception as e:
            # file exists -> update
            file = repo.get_contents(path, ref=new_branch)
            repo.update_file(path, f"AI update: {title}", content, file.sha, branch=new_branch)

    pr = repo.create_pull(title=title, body=body, head=new_branch, base="main")
    return pr.html_url

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--log", required=True)
    parser.add_argument("--repo", required=True)
    parser.add_argument("--branch", required=False, default="main")
    args = parser.parse_args()

    log_text = read_file(args.log) if Path(args.log).exists() else "No log file."
    excerpt = "\n".join(log_text.splitlines()[-600:])
    files = [f for f in os.listdir('.') if f in ('pubspec.yaml','android','lib','build.gradle','gradle.properties')]
    file_list = "\n".join(files)

    prompt = build_prompt(args.repo, excerpt, file_list)
    print("Asking AI... (this may incur API usage)...")
    ai_out = ask_ai(prompt)

    # Try to parse JSON from AI output
    data = None
    try:
        # find first JSON object in the response
        start = ai_out.find("{")
        data = json.loads(ai_out[start:])
    except Exception:
        # fallback: create an issue with AI text
        gh = Github(GITHUB_TOKEN)
        repo = gh.get_repo(args.repo)
        issue = repo.create_issue(title="AI analysis: build failure", body=ai_out)
        print("Created Issue:", issue.html_url)
        return

    files_to_commit = data.get("files", [])
    title = "AI suggested fix for build failure"
    body = f"AI analysis:\n\n{data.get('cause','')}\n\n{data.get('patch_description','')}"
    if files_to_commit:
        pr_url = create_branch_and_pr(args.repo, files_to_commit, title, body)
        print("Created PR:", pr_url)
    else:
        gh = Github(GITHUB_TOKEN)
        repo = gh.get_repo(args.repo)
        issue = repo.create_issue(title=title, body=body)
        print("Created Issue:", issue.html_url)

if __name__ == "__main__":
    main()
