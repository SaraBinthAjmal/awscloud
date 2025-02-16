This part covers VPC Internet gateway and other Stuff from VPC(Virtual Private Cloud)


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
delete-internet-gateway --internet-gateway-id <value>

```

