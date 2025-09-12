import os
import subprocess
from pathlib import Path
import google.generativeai as genai

# ✅ إعداد مفتاح Gemini من Secrets
genai.configure(api_key=os.getenv("GOOGLE_API_KEY"))

def run_cmd(cmd):
    return subprocess.run(cmd, capture_output=True, text=True)

def detect_project_type():
    files = [f.name for f in Path(".").rglob("*")]

    if "build.gradle" in files or "settings.gradle" in files:
        return "android"
    if "pubspec.yaml" in files:
        return "flutter"
    if "requirements.txt" in files or any(f.endswith(".py") for f in files):
        return "python"
    if "index.html" in files:
        return "web"
    return "unknown"

def build_project(project_type):
    if project_type == "android":
        return run_cmd(["./gradlew", "assembleDebug"])
    elif project_type == "flutter":
        return run_cmd(["flutter", "build", "apk"])
    elif project_type == "python":
        return subprocess.CompletedProcess(args=["python"], returncode=0, stdout="Python OK", stderr="")
    elif project_type == "web":
        return subprocess.CompletedProcess(args=["html"], returncode=0, stdout="Web OK", stderr="")
    return subprocess.CompletedProcess(args=["unknown"], returncode=1, stdout="", stderr="Unknown project type")

def ai_fix(error_log):
    print("🤖 AI is analyzing the error...")
    model = genai.GenerativeModel("gemini-1.5-flash")

    prompt = f"""
    The build failed with this error:
    {error_log}

    Task:
    1. Identify the language/framework of the project.
    2. Suggest missing files or code fixes.
    3. Return ONLY the fixed code with filename and content.
    """

    response = model.generate_content(prompt)
    return response.text

def apply_fix(ai_output):
    if not ai_output:
        return

    lines = ai_output.splitlines()
    current_file = None
    buffer = []

    for line in lines:
        if line.startswith("=== File:"):
            if current_file:
                Path(current_file).parent.mkdir(parents=True, exist_ok=True)
                with open(current_file, "w") as f:
                    f.write("\n".join(buffer))
                print(f"✅ Applied fix to {current_file}")
                buffer = []
            current_file = line.replace("=== File:", "").strip()
        else:
            buffer.append(line)

    if current_file and buffer:
        Path(current_file).parent.mkdir(parents=True, exist_ok=True)
        with open(current_file, "w") as f:
            f.write("\n".join(buffer))
        print(f"✅ Applied fix to {current_file}")

def git_commit_and_push():
    run_cmd(["git", "config", "--global", "user.name", "ai-bot"])
    run_cmd(["git", "config", "--global", "user.email", "ai-bot@example.com"])
    run_cmd(["git", "checkout", "-B", "ai-fix"])
    run_cmd(["git", "add", "."])
    run_cmd(["git", "commit", "-m", "🤖 AI Auto Fix"])
    run_cmd(["git", "push", "-f", "origin", "ai-fix"])
    print("📤 AI fixes pushed to branch: ai-fix")

if __name__ == "__main__":
    project_type = detect_project_type()
    print(f"🔎 Detected project type: {project_type}")

    result = build_project(project_type)

    if result.returncode == 0:
        print("✅ Build success")
    else:
        print("❌ Build failed")
        print(result.stderr)

        # 🔧 طلب مساعدة الذكاء الصناعي
        fix = ai_fix(result.stderr)
        print("🤖 AI Suggested Fix:\n", fix)

        # 🛠️ تطبيق الإصلاحات
        apply_fix(fix)

        # 📤 رفع التعديلات أوتوماتيك
        git_commit_and_push()

        print("🔁 You can re-run the build now with fixed files")
