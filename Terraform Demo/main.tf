provider "aws" {
  region = "us-east-1"
}


# Fetch the default VPC
data "aws_vpc" "default" {
  default = true
}
# Create a new subnet inside the default VPC
resource "aws_subnet" "new_subnet" {
  vpc_id            = data.aws_vpc.default.id
  cidr_block        = "172.31.0.55/28"  # Change this CIDR block if needed
  availability_zone = "us-east-1"  # Specify the AZ

  tags = {
    Name = "Grafana-Subnet"
  }
}


# Create an EC2 instance in the new subnet
resource "aws_instance" "test" {
  # ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  ami           = "ami-085ad6ae776d8f09c" #Amazon Linux 2023 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Grafana-Instance"
  }
}