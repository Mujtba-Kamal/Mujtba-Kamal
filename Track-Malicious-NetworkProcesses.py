import psutil
import socket

# المنافذ الشائعة التي تستخدمها برمجيات التروجان واختراق الخلفية (Backdoors)
suspicious_ports = [4444, 5555, 6666, 7777, 9999]

print("🔍 Scanning active network processes for cyber threats...")

for conn in psutil.net_connections(kind='inet'):
    if conn.status == 'ESTABLISHED' and conn.raddr:
        remote_port = conn.raddr.port
        if remote_port in suspicious_ports:
            try:
                process = psutil.Process(conn.pid)
                print(f"🚨 CRITICAL THREAT: Process '{process.name()}' (PID: {conn.pid}) is connected to a suspicious remote port: {remote_port}")
            except psutil.NoSuchProcess:
                pass
