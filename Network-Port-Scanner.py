import socket
import sys
from datetime import datetime

# تحديد الهدف (سيرفر داخلي أو IP جهاز)
target_ip = "192.168.1.10"
# المنافذ الشائعة المطلوب فحصها أمنياً
common_ports = [21, 22, 23, 25, 53, 80, 110, 443, 445, 3389, 8080]

print("-" * 50)
print(f"Scanning Target: {target_ip}")
print(f"Time Started: {str(datetime.now())}")
print("-" * 50)

try:
    for port in common_ports:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(1.0) # انتظار ثانية واحدة للاستجابة
        result = s.connect_ex((target_ip, port))
        if result == 0:
            print(f"🔓 Port {port}: OPEN")
        s.close()
except KeyboardInterrupt:
    print("\nExiting script.")
    sys.exit()
except socket.error:
    print("\nCould not connect to server.")
    sys.exit()
