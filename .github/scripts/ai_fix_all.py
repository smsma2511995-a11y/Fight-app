#!/usr/bin/env python3
import os, glob, time
import google.generativeai as genai

API_KEY = os.environ.get("GEMINI_API_KEY")
if not API_KEY:
    print("No GEMINI_API_KEY in environment - aborting.")
    exit(1)

genai.configure(api_key=API_KEY)
model = genai.GenerativeModel("gemini-1.5-flash")

patterns = [
    "lib/**/*.dart",
    "**/pubspec.yaml",
    "**/build.gradle",
    "**/settings.gradle",
    "**/gradle.properties",
    "**/package.json",
    "**/requirements.txt",
    "firebase.json",
    "codemagic.yaml",
    "README.md"
]

files = []
for p in patterns:
    files.extend(glob.glob(p, recursive=True))
files = sorted(set(files))

report = []
changed = 0

def trim(s, n=7000):
    return s if len(s) <= n else s[:n//2] + "\n/*...TRUNCATED...*/\n" + s[-n//2:]

for f in files:
    try:
        text = open(f, "r", encoding="utf-8", errors="ignore").read()
    except Exception as e:
        report.append(f"ERROR reading {f}: {e}")
        continue
    prompt = (
        "You are an expert developer. Fix and upgrade this file so it is correct and compatible. "
        "Return ONLY the full corrected file content. No explanations.\n\n"
        f"FILEPATH: {f}\n\n{trim(text)}"
    )
    try:
        resp = model.generate_content(prompt)
        new = (resp.text or "").strip()
        if new and new != text:
            with open(f, "w", encoding="utf-8") as w:
                w.write(new)
            report.append(f"UPDATED: {f}")
            changed += 1
        else:
            report.append(f"NOCHANGE: {f}")
    except Exception as e:
        report.append(f"AI ERROR {f}: {e}")
    time.sleep(1)

report.insert(0, f"AI Fix run - targeted {len(files)} files - updated {changed}")
os.makedirs(".github", exist_ok=True)
with open(".github/ai_report.txt", "w", encoding="utf-8") as r:
    r.write("\n".join(report))
