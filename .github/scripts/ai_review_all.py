import google.generativeai as genai
import os, pathlib

# إعداد Gemini
genai.configure(api_key=os.getenv("GEMINI_API_KEY"))
model = genai.GenerativeModel("gemini-1.5-flash")

# الامتدادات المستهدفة
TARGET_EXTENSIONS = [".java", ".kt", ".dart", ".py", ".js", ".ts", ".yaml", ".yml", ".gradle"]

repo_root = pathlib.Path(".")

def review_and_fix(file_path: pathlib.Path):
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            code = f.read()
        prompt = f"""
        راجع الكود التالي وصححه أو حسّنه. رجّع نسخة كاملة من الملف جاهزة للاستبدال:
        {code}
        """
        response = model.generate_content(prompt)
        fixed_code = response.text.strip()

        # استبدال الملف مباشرة
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(fixed_code)

        print(f"✅ تم إصلاح: {file_path}")
    except Exception as e:
        print(f"⚠️ خطأ مع {file_path}: {e}")

# المرور على الملفات
for path in repo_root.rglob("*"):
    if path.is_file() and path.suffix in TARGET_EXTENSIONS:
        review_and_fix(path)

print("🎉 انتهى: كل الملفات تم إصلاحها مباشرة في مكانها.")
