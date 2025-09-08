import os
import subprocess
import sys

def run_cmd(command):
    """Run a shell command safely and stream output."""
    print(f"\n▶ Running: {command}\n")
    process = subprocess.Popen(
        command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
    )
    for line in process.stdout:
        print(line, end="")
    stderr = process.stderr.read()
    if stderr:
        print(f"\n⚠️ Error:\n{stderr}")
    process.wait()
    return process.returncode

def main():
    print("🚀 Starting AI Fix & Build Script...")

    # Step 1: Clean project
    run_cmd("./gradlew clean")

    # Step 2: Try building Debug APK
    code = run_cmd("./gradlew assembleDebug")
    if code != 0:
        print("❌ Debug build failed, trying Release...")
        run_cmd("./gradlew assembleRelease")

    # Step 3: Check artifacts
    debug_apk = "app/build/outputs/apk/debug/app-debug.apk"
    release_apk = "app/build/outputs/apk/release/app-release.apk"

    if os.path.exists(debug_apk):
        print(f"✅ Debug APK generated at: {debug_apk}")
    elif os.path.exists(release_apk):
        print(f"✅ Release APK generated at: {release_apk}")
    else:
        print("❌ No APKs found. Please check Gradle logs.")

if __name__ == "__main__":
    sys.exit(main())
