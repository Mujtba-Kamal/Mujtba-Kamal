import boto3

def stop_dev_instances():
    ec2 = boto3.resource('ec2', region_name='us-east-1')
    print("🔍 Scanning AWS environment for non-essential Development servers...")
    
    # فحص السيرفرات التي تحمل تاغ "Environment: Dev" وتعمل حالياً
    filters = [
        {'Name': 'tag:Environment', 'Values': ['Dev', 'Test']},
        {'Name': 'instance-state-name', 'Values': ['running']}
    ]
    
    instances = ec2.instances.filter(Filters=filters)
    instance_ids = [instance.id for instance in instances]
    
    if instance_ids:
        print(f"⚠️ Found {len(instance_ids)} active Dev instances. Initiating safe shutdown sequence...")
        ec2.instances.filter(InstanceIds=instance_ids).stop()
        print("🔒 Cost optimization sequence complete. Instances stopped.")
    else:
        print("✅ No idle Development servers detected running.")

if __name__ == "__main__":
    stop_dev_instances()
