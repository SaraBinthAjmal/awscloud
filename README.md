# This is the Git hub repo to showcase my work in AWS
## Chapter 1 : AWS CLI/CloudFormation

    In this Chapter I will create the lab to show the AWS resource creation through
    AWS CLI and CloudFormation

    1: The below is the command to create VPC through AWS CLI

```
            aws ec2 create-vpc \
              --cidr-block 10.0.0.0/16 \
              --tag-specifications "ResourceType=vpc,Tags=[{Key=Name,Value=MyVpc}]"

```           
Sample Output

```
{
    "Vpc": {
        "CidrBlock": "10.0.0.0/16",
        "DhcpOptionsId": "dopt-0f2fdf4ddbc536009",
        "State": "pending",
        "VpcId": "vpc-0b126e7a6aa4f0f00",
        "OwnerId": "123456789",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-03ff1ca50689a78d7",
                "CidrBlock": "10.0.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false,
        "Tags": [
            {
                "Key": "Name",
                "Value": "MyVpc"
            }
        ]
    }
}

```
Check VPCs you created using this command(using VPC ids listed above while you created)
```
aws ec2 describe-vpcs --vpc-ids <value>

```
Sample Output will be like this and pending state will be changed to available

```
{
    "Vpcs": [
        {
            "CidrBlock": "172.31.0.0/16",
            "DhcpOptionsId": "dopt-0f2fdf4ddbc536009",
            "State": "available",
            "VpcId": "vpc-00027fefa9345cb18",
            "OwnerId": "12354654",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-0f42dd2a8cceb76a5",
                    "CidrBlock": "172.31.0.0/16",
                    "CidrBlockState": {
                        "State": "associated"
                    }
                }
            ],
            "IsDefault": true
        }
    ]
}

```
If you need to remove the above VPC, you need to follow these steps otherwise it will show errors like these 
"An error occurred (DependencyViolation) when calling the DeleteVpc operation"

1: You need to find the Internet gateway which you wanted to delete 

```
aws ec2 describe-internet-gateways

```

sample output:

```
{
    "InternetGateways": [
        {
            "Attachments": [
                {
                    "State": "available",
                    "VpcId": "vpc-00027fefa9345cb18"
                }
            ],
            "InternetGatewayId": "igw-0510cec443b7499bc",
            "OwnerId": "471112757594",
            "Tags": []
        }
    ]
}

```
2: Once You got the internet gateway detach the internet gateway from VPC and delete it
    dont forget to add --internet-gateway-id & --vpc-id 
```
aws ec2 detach-internet-gateway --internet-gateway-id <value> --vpc-id <value>

```
```


```