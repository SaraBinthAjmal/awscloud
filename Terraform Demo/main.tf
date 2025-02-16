provider "aws" {
  region = "us-east-1"
}

# Addding Security Group here

resource "aws_security_group" "example_sg" {
  name        = "grafana-sg"
  description = "Allow inbound traffic on port 3000"

  vpc_id = "vpc-0424bd07b2433d81c" # Replace with your actual VPC ID

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows access from anywhere. Restrict this in production.
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allows all outbound traffic
  }

  tags = {
    Name = "grafana-sg"
  }
}

resource "aws_subnet" "custom_subnet" {
  vpc_id                  = vpc-0424bd07b2433d81c
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

# AWS instance here 
resource "aws_instance" "test" {
  # ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  ami           = "ami-085ad6ae776d8f09c" #Amazon Linux 2023 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Grafana-Server"
  }
}