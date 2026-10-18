import re
from collections import Counter

# مسار افتراضي لسجل جدار الحماية (يمكن توجيهه لسجلات Palo Alto أو Windows Firewall)
log_file_path = "C:\\Windows\\System32\\LogFiles\\Firewall\\pfirewall.log"
blocked_ips = []

print("📊 Analyzing Firewall Logs for malicious traffic patterns...")

try:
    with open(log_file_path, "r") as file:
        for line in file:
            # البحث عن كلمة DROP أو BLOCK وعزل الـ IP المصدر
            if "DROP" in line or "ALLOW" not in line:
                ip_match = re.search(r'\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b', line)
                if ip_match:
                    blocked_ips.append(ip_match.group())
                    
    # عرض أكثر 5 عناوين IP تم حظرها
    top_attackers = Counter(blocked_ips).most_common(5)
    print("\n🔥 TOP 5 SOURCE IPs BLOCKED BY FIREWALL:")
    for ip, count in top_attackers:
        print(f"IP: {ip} - Repeated Attempts: {count} times")
except FileNotFoundError:
    print("ℹ️ Firewall log file not found. Ensure logging is enabled in Firewall profile settings.")
