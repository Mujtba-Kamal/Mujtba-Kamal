import os
import re

print("Scanning ARP Cache for connected hardware MAC Addresses...")
arp_output = os.popen("arp -a").read()
mac_addresses = re.findall(r'([-.0-9a-fA-F]{17,19})', arp_output)

for mac in mac_addresses:
    print(f"🔒 Detected Device MAC: {mac}")
