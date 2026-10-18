import os
import sys
import time

target_host = "8.8.8.8"
print(f"=== Beginning Network Latency Path Audit for {target_host} ===")

# تنفيذ أمر Traceroute/Tracert بناء على نظام التشغيل
cmd = f"tracert {target_host}" if os.name == 'nt' else f"traceroute {target_host}"

start_time = time.time()
response = os.system(cmd)
end_time = time.time()

print("\n--- Audit Summary ---")
if response == 0:
    print(f"Status: Success\nTotal Path Execution Time: {round(end_time - start_time, 2)} seconds")
else:
    print("Status: Packet Loss / Destination Unreachable detected along the path.")
