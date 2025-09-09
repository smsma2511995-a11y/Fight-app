#!/usr/bin/env python3
import os
import glob
import time
from google import genai

API_KEY = os.environ.get("GEMINI_API_KEY")
if not API_KEY:
    print("No GEMINI_API_KEY found, aborting.")
    exit(1)

genai_client = genai.Client(api_key=API_KEY)
model = genai_client.models.get("gemini-2.0-flash")

patterns = [
    "lib/**/*.dart",
    "**/pubspec.yaml",
    "**/build.gradle",
    "**/settings.gradle",
    "**/package.json",
    "**/requirements.txt",
    "firebase.json",
    "README.md"
]

files = []
for p in patterns:
    files.extend(glob.glob(p, recursive=True))

files = sorted(set(files))
report_lines = []
changed_count = 0

def prepare_text(text, max_chars=7000):
    if len(text) <= max_chars:
        return text
    half = max_chars // 2
    return text[:half] + "\n\n/*...TRUNCATED...*/\n\n" + text[-half:]

for f in files:
    try:
        with open(f, "r", encoding="utf-8", errors="ignore") as fh:
            original = fh.read()
    except Exception as e:
        report_lines.append(f"ERROR reading {f}: {e}")
        continue

    snippet = prepare_text(original)
    prompt = f"You are an expert developer. Fix this file if needed:\n\nFILEPATH: {f}\n{snippet}"

    try:
        resp = model.generate_content(prompt)
        new_content = resp.text.strip("\r\n") if resp.text else ""
        if new_content and new_content != original:
            with open(f, "w", encoding="utf-8") as fh:
                fh.write(new_content)
            report_lines.append(f"UPDATED: {f}")
            changed_count += 1
        else:
            report_lines.append(f"NOCHANGE: {f}")
    except Exception as e:
        report_lines.append(f"AI ERROR for {f}: {e}")

    time.sleep(1)

report_lines.insert(0, f"AI Fix run - files targeted: {len(files)} - updated: {changed_count}")
os.makedirs(".github", exist_ok=True)
with open(".github/ai_report.txt", "w", encoding="utf-8") as rf:
    rf.write("\n".join(report_lines))

print("AI fix completed. Report saved to .github/ai_report.txt")
