import boto3
from datetime import datetime, timezone

def check_aws_certificates():
    iam = boto3.client('iam')
    print("☁️ Fetching SSL/TLS Certificates from AWS IAM...")
    
    try:
        response = iam.list_server_certificates()
        for cert in response['ServerCertificateMetadataList']:
            cert_name = cert['ServerCertificateName']
            exp_date = cert['Expiration']
            days_left = (exp_date - datetime.now(timezone.utc)).days
            
            if days_left < 30:
                print(f"🚨 WARNING: Certificate [{cert_name}] expires in {days_left} days!")
            else:
                print(f"✅ Certificate [{cert_name}] is secure ({days_left} days remaining).")
    except Exception as e:
        print(f"❌ Error connecting to AWS: {e}")

if __name__ == "__main__":
    check_aws_certificates()
