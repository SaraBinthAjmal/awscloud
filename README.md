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
        "OwnerId": "471112757594",
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

