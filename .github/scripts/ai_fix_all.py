#!/usr/bin/env python3
import os
import glob
import time
import google.generativeai as genai

API_KEY = os.environ.get("GEMINI_API_KEY")
if not API_KEY:
    print("No GEMINI_API_KEY in environment - aborting.")
    exit(1)

genai.configure(api_key=API_KEY)
model = genai.GenerativeModel("gemini-1.5-flash")

# الملفات المستهدفة (تقدر تضيف امتدادات لو حبيت)
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

report_lines = []
changed = 0

def prepare_text(s, max_chars=7000):
    if len(s) <= max_chars:
        return s
    half = max_chars//2
    return s[:half] + "\n\n/*...TRUNCATED...*/\n\n" + s[-half:]

for f in files:
    try:
        with open(f, "r", encoding="utf-8", errors="ignore") as fh:
            orig = fh.read()
    except Exception as e:
        report_lines.append(f"ERROR reading {f}: {e}")
        continue

    snippet = prepare_text(orig)
    prompt = (
        "You are an expert developer. Fix and upgrade this file so it is correct and compatible. "
        "Return ONLY the full corrected file content, no explanations, no comments about what you changed. "
        f"If nothing to change, return the original content unchanged.\n\nFILEPATH: {f}\n\n{snippet}"
    )

    try:
        resp = model.generate_content(prompt)
        new = resp.text or ""
        new = new.strip("\r\n")
        if new and new != orig:
            with open(f, "w", encoding="utf-8") as fh:
                fh.write(new)
            report_lines.append(f"UPDATED: {f}")
            changed += 1
        else:
            report_lines.append(f"NOCHANGE: {f}")
    except Exception as e:
        report_lines.append(f"AI ERROR for {f}: {e}")

    time.sleep(1)  # avoid too-fast requests

report_lines.insert(0, f"AI Fix run - files targeted: {len(files)} - updated: {changed}")
os.makedirs(".github", exist_ok=True)
with open(".github/ai_report.txt", "w", encoding="utf-8") as rf:
    rf.write("\n".join(report_lines))

print("AI fix completed. Report written to .github/ai_report.txt")
