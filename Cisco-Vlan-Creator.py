from netmiko import ConnectHandler

device = {
    'device_type': 'cisco_ios',
    'host': '192.168.1.1',
    'username': 'admin',
    'password': 'password123'
}

vlans = {'10': 'Data_Dept', '20': 'Voice_Dept', '30': 'Guest_Network'}

net_connect = ConnectHandler(**device)
for vlan_id, vlan_name in vlans.items():
    commands = [f'vlan {vlan_id}', f'name {vlan_name}']
    net_connect.send_config_set(commands)
    print(f"✅ Created VLAN {vlan_id}: {vlan_name}")
net_connect.disconnect()
