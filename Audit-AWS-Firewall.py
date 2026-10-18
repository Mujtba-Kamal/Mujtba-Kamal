import boto3

def audit_security_groups():
    ec2 = boto3.client('ec2', region_name='us-east-1')
    print("🛡️ Auditing AWS Cloud Firewall (Security Groups) rules...")
    
    response = ec2.describe_security_groups()
    for sg in response['SecurityGroups']:
        for permission in sg.get('IpPermissions', []):
            for ip_range in permission.get('IpRanges', []):
                # التحقق مما إذا كان المنفذ مفتوحاً للعامة
                if ip_range.get('CidrIp') == '0.0.0.0/0':
                    from_port = permission.get('FromPort')
                    if from_port in:
                        print(f"🚨 SECURITY GAP: Security Group [{sg['GroupName']}] has dangerous port {from_port} open to the WORLD!")

if __name__ == "__main__":
    audit_security_groups()
