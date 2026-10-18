import ssl
import socket
import datetime

hostname = 'google.com'
ctx = ssl.create_default_context()
with socket.create_connection((hostname, 443)) as sock:
    with ctx.wrap_socket(sock, server_hostname=hostname) as ssock:
        cert = ssock.getpeercert()
        print(f"🔒 Certificate for {hostname} expires on: {cert['notAfter']}")
