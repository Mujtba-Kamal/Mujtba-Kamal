import os
import platform

print(f"Checking hardware system platform: {platform.system()}")
# Pulls last boot time metrics
if platform.system() == "Windows":
    os.system("net statistics workstation | find \"Statistics since\"")
else:
    os.system("uptime")
