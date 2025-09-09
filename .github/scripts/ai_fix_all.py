import os
import glob
import time
from google import genai

# Ensure GEMINI_API_KEY is available as an environment variable
if "GEMINI_API_KEY" not in os.environ:
    print("Error: GEMINI_API_KEY environment variable not set.")
    exit(1)

# التغيير هنا: العودة إلى استخدام genai.Client() بدلاً من genai.configure()
# أو إذا كنت متأكداً من تثبيت أحدث إصدار، فقد تحتاج إلى نموذج مختلف للمصنف.
# في هذه الحالة، سنستخدم genai.Client
client = genai.Client(api_key=os.environ["GEMINI_API_KEY"])


patterns = [
    "lib/**/*.dart",
    "**/pubspec.yaml",
    "**/build.gradle",
    "**/build.gradle.kts",
    "**/settings.gradle",
    "**/gradle.properties",
    "**/package.json",
    "**/requirements.txt",
    "firebase.json",
    "codemagic.yaml",
    "README.md"
]

files = sorted(set(sum([glob.glob(p, recursive=True) for p in patterns], [])))
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
    prompt = f"You are an expert developer. Fix and upgrade this file:\nFILEPATH: {f}\n{snippet}"

    try:
        # التغيير هنا: استخدام العميل الذي تم تهيئته مباشرةً
        resp = client.generate_content(model="gemini-pro", prompt=prompt) # نموذج "gemini-pro" أو "gemini-1.5-flash"
        new = resp.text.strip() # Access text from the response
        if new and new != orig:
            with open(f, "w", encoding="utf-8") as fh:
                fh.write(new)
            report_lines.append(f"UPDATED: {f}")
            changed += 1
        else:
            report_lines.append(f"NOCHANGE: {f}")
    except Exception as e:
        report_lines.append(f"AI ERROR for {f}: {e}")

    time.sleep(1)

report_lines.insert(0, f"AI Fix run - files targeted: {len(files)} - updated: {changed}")
os.makedirs(".github", exist_ok=True)
with open(".github/ai_report.txt", "w", encoding="utf-8") as rf:
    rf.write("\n".join(report_lines))

print("AI fix completed. Report written to .github/ai_report.txt")
