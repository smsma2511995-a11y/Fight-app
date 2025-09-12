import os
import google.generativeai as genai

# إعداد الـ API Key
genai.configure(api_key=os.environ["GEMINI_API_KEY"])

MODEL_NAME = "gemini-1.5-flash"
AI_MODE = os.getenv("AI_MODE", "report")  # القيمة الافتراضية تقرير

def run_ai_fixer():
    changes = []

    # نمسك كل الملفات البرمجية
    for root, dirs, files in os.walk("."):
        for file in files:
            if file.endswith((".py", ".dart", ".js", ".ts", ".java", ".kt", ".yaml", ".yml")):
                path = os.path.join(root, file)
                try:
                    with open(path, "r", encoding="utf-8") as f:
                        code = f.read()

                    prompt = f"راجع الكود التالي، صحح الأخطاء أو أكمل الأجزاء الناقصة:\n\n{code}"
                    response = genai.GenerativeModel(MODEL_NAME).generate_content(prompt)

                    suggestion = response.text.strip()
                    if suggestion and suggestion != code:
                        changes.append((path, suggestion))

                        if AI_MODE == "apply":
                            with open(path, "w", encoding="utf-8") as f:
                                f.write(suggestion)

                except Exception as e:
                    print(f"⚠️ خطأ في {path}: {e}")

    # حفظ التقرير
    report_path = ".github/ai_changes_report.md"
    with open(report_path, "w", encoding="utf-8") as r:
        for path, suggestion in changes:
            r.write(f"## {path}\n```diff\n{suggestion}\n```\n\n")

    print(f"✅ AI Fixer أنهى العملية ({AI_MODE}). تقرير: {report_path}")


if __name__ == "__main__":
    run_ai_fixer()
