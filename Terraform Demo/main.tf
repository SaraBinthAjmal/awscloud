provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test" {
  # ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  ami           = "ami-085ad6ae776d8f09c" #Amazon Linux 2023 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-Instance"
  }
}