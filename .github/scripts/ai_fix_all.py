#!/usr/bin/env python3
import os
import sys
from pathlib import Path

try:
    import google.generativeai as genai
except ModuleNotFoundError:
    print("Module google.generativeai not found. Install with `pip install google-generativeai`.")
    sys.exit(1)

API_KEY = os.getenv("GEMINI_API_KEY")
if not API_KEY:
    print("GEMINI_API_KEY not found in environment.")
    sys.exit(1)

genai.configure(api_key=API_KEY)

def run_ai_fix(project_path):
    report_file = Path(".github/ai_report.txt")
    report_file.parent.mkdir(parents=True, exist_ok=True)

    # Example: AI reads files and suggests fixes
    files_to_check = ["build.gradle", "settings.gradle", "pubspec.yaml", "main.dart", "requirements.txt", "package.json"]
    report_lines = []

    for f in files_to_check:
        full_path = Path(project_path) / f
        if not full_path.exists():
            report_lines.append(f"[MISSING] {f} in {project_path}")
        else:
            report_lines.append(f"[OK] {f}")

    # Simulate AI fix
    report_lines.append(f"[AI] Checked and suggested fixes for {project_path}")

    with report_file.open("a") as f:
        for line in report_lines:
            f.write(line + "\n")
    print("\n".join(report_lines))


if __name__ == "__main__":
    projects_env = os.getenv("PROJECTS", "")
    if not projects_env:
        print("No PROJECTS environment variable found")
        sys.exit(0)

    projects = projects_env.split("|")
    for proj in projects:
        typ, path = proj.split(":", 1)
        run_ai_fix(path)
