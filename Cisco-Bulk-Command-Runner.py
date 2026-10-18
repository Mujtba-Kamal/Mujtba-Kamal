from netmiko import ConnectHandler

devices = ['192.168.1.10', '192.168.1.11', '192.168.1.12']
for ip in devices:
    device = {'device_type': 'cisco_ios', 'host': ip, 'username': 'admin', 'password': 'password'}
    try:
        net_connect = ConnectHandler(**device)
        net_connect.send_config_set(['ntp server 8.8.8.8'])
        print(f"✅ Updated NTP on {ip}")
    except Exception as e:
        print(f"❌ Failed to connect to {ip}: {e}")
