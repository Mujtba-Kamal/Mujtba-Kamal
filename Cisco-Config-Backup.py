from netmiko import ConnectHandler
import datetime

# معلومات الاتصال بجهاز الشبكة
cisco_device = {
    'device_type': 'cisco_ios',
    'host': '192.168.10.1',
    'username': 'admin',
    'password': 'SecureNetworkPassword2026',
}

print(f"Connecting to {cisco_device['host']}...")
net_connect = ConnectHandler(**cisco_device)

# تنفيذ أمر سحب الإعدادات
output = net_connect.send_command('show running-config')

# حفظ الملف بالتاريخ الحالي
today = datetime.date.today()
filename = f"Cisco_Backup_{cisco_device['host']}_{today}.txt"

with open(filename, 'w') as backup_file:
    backup_file.write(output)

print(f"✅ Configuration successfully backed up to {filename}")
net_connect.disconnect()
