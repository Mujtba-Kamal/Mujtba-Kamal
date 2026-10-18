import struct
import socket

def get_hosts(cidr):
    return (2 ** (32 - int(cidr))) - 2

cidr_block = "24"
print(f"Subnet CIDR /{cidr_block} provides {get_hosts(cidr_block)} usable IP addresses for hosts.")
