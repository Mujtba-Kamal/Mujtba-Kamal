from netmiko import ConnectHandler
# Audit tool for cisco ports
device = {'device_type': 'cisco_ios', 'host': '192.168.1.1', 'username': 'admin', 'password': 'pwd'}
connection = ConnectHandler(**device)
output = connection.send_command('show ip interface brief | include down')
print("--- Down Interfaces Report --- \n", output)
connection.disconnect()
