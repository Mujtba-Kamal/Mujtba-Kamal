import os

# قائمة بعناوين الأجهزة والسيرفرات التي تريد فحصها
devices = ["8.8.8.8", "1.1.1.1", "192.168.1.1"]

print("--- جاري فحص حالة الأجهزة في الشبكة ---")

for ip in devices:
    # إرسال حزمة ping واحدة لكل جهاز
    response = os.system(f"ping -c 1 {ip}" if os.name != 'nt' else f"ping -n 1 {ip}")
    
    if response == 0:
        print(f"✅ الجهاز {ip} متصل ويعمل (Online)")
    else:
        print(f"❌ الجهاز {ip} غير متصل (Offline)")
