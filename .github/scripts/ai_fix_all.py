#!/usr/bin/env python3
import os
import glob
import time
import google.generativeai as genai

# 🔑 جلب مفتاح Gemini
API_KEY = os.getenv("GEMINI_API_KEY")
if not API_KEY:
    print("❌ مفيش مفتاح GEMINI_API_KEY")
    exit(1)

genai.configure(api_key=API_KEY)
model = genai.GenerativeModel("gemini-1.5-flash")

# الامتدادات المستهدفة للتصليح
patterns = [
    "lib/**/*.dart",
    "**/*.gradle",
    "**/*.yaml",
    "**/*.yml",
    "**/*.xml",
    "**/*.kt",
    "**/*.java",
    "package.json",
    "requirements.txt"
]

# جمع الملفات
files = []
for p in patterns:
    files.extend(glob.glob(p, recursive=True))
files = sorted(set(files))

report_lines = []
changed = 0

def prepare_text(s, max_chars=6000):
    if len(s) <= max_chars:
        return s
    half = max_chars // 2
    return s[:half] + "\n\n/*...TRUNCATED...*/\n\n" + s[-half:]

for f in files:
    try:
        with open(f, "r", encoding="utf-8", errors="ignore") as fh:
            orig = fh.read()
    except Exception as e:
        report_lines.append(f"❌ قراءة {f} فشلت: {e}")
        continue

    snippet = prepare_text(orig)
    prompt = f"""
    أصلح الكود التالي بحيث يكون صالح للبناء والتشغيل.
    رجع **الملف كامل** بدون شروحات، ولا تحذف أي جزء إلا لو ضروري.

    FILEPATH: {f}
    ===== FILE START =====
    {snippet}
    ===== FILE END =====
    """

    try:
        resp = model.generate_content(prompt)
        new = resp.text or ""
        new = new.strip("\r\n")

        if new and new != orig:
            with open(f, "w", encoding="utf-8") as fh:
                fh.write(new)
            report_lines.append(f"✅ تم التحديث: {f}")
            changed += 1
        else:
            report_lines.append(f"ℹ️ بدون تغيير: {f}")
    except Exception as e:
        report_lines.append(f"⚠️ خطأ AI مع {f}: {e}")

    time.sleep(1)

# حفظ تقرير
os.makedirs(".github", exist_ok=True)
with open(".github/ai_report.txt", "w", encoding="utf-8") as rf:
    rf.write("\n".join(report_lines))

print(f"🎯 AI خلص — عدّل {changed} ملف/ملفات. تقرير محفوظ في .github/ai_report.txt")
