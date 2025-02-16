import boto3

def create_ec2_instance(ami, instance_type, key_name, security_group_ids):
  """Creates an EC2 instance with the specified parameters.

  Args:
    ami: The AMI ID of the Ubuntu Linux image.
    instance_type: The type of instance to create.
    key_name: The name of the key pair to use.
    security_group_ids: A list of security group IDs.

  Returns:
    The ID of the created instance.
  """

  ec2 = boto3.resource('ec2')

  try:
    instance = ec2.create_instances(
      ImageId=ami,
      InstanceType=instance_type,
      KeyName=key_name,
      SecurityGroupIds=security_group_ids,
      MinCount=1,
      MaxCount=1
    )
    instance_id = instance[0].id
    print(f"EC2 instance created with ID: {instance_id}")
    return instance_id
  except Exception as e:
    print(f"Error creating EC2 instance: {e}")
    return None

# Example usage
ami = "ami-0c55b159cbfafe1f0"  # Replace with your desired AMI
instance_type = "t2.micro"
key_name = "my-key-pair"
security_group_ids = ["sg-0123456789abcdef0"]  # Replace with your security group ID

instance_id = create_ec2_instance(ami, instance_type, key_name, security_group_ids)
