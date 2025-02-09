# Setting Up Terraform
Running Terraform scripts in AWS involves several steps, including installing Terraform, configuring AWS credentials, writing Terraform configurations, initializing Terraform, applying the configuration, and verifying the deployed resources. Below is a step-by-step guide.
________________________________________
1. Install Terraform
Download and install Terraform on your system:
•	Download Terraform
•	Verify installation: 
•	terraform -version
________________________________________
2. Configure AWS Credentials
Terraform needs AWS credentials to provision resources. You can set them up using the AWS CLI:

### Method 1: Using AWS CLI
Install AWS CLI and configure credentials:
```
aws configure
```
```
Enter:
•	AWS Access Key ID
•	AWS Secret Access Key
•	Default Region (e.g., us-east-1)
•	Output format (json, yaml, table, or text)
Credentials will be stored in:
~/.aws/credentials (Linux/Mac)
C:\Users\USERNAME\.aws\credentials (Windows)
```

### Method 2: Using Environment Variables
Alternatively, set credentials via environment variables:
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="us-east-1"
________________________________________
3. Write Terraform Configuration File
Create a new directory for your Terraform project and navigate to it:

```
mkdir terraform-aws-demo && cd terraform-aws-demo

```

## Create a Terraform configuration file (main.tf) to define AWS resources. Example:

```

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-Instance"
  }
}

```
________________________________________
4. Initialize Terraform
Run the following command to initialize the Terraform working directory:
```
terraform init

```
This downloads the AWS provider plugin required for deployment.
________________________________________
5. Preview Changes
Check what Terraform will create without making actual changes:

```
terraform plan

```
________________________________________
6. Apply Terraform Configuration
Deploy the resources to AWS:

``
terraform apply

```
Terraform will prompt for confirmation. Type yes to proceed.
________________________________________
7. Verify the Deployment
After applying, Terraform will output details about the created resources. You can also verify in the AWS Management Console.
To get instance details:
```
terraform output
```
________________________________________
8. Destroy Resources (Optional)
To clean up and remove resources:
```
terraform destroy

```
Type yes when prompted.
________________________________________
9. Automating Terraform Execution (Optional)
For automation, use a shell script (deploy.sh):
#!/bin/bash
terraform init
terraform plan
terraform apply -auto-approve
Run:
chmod +x deploy.sh
./deploy.sh
________________________________________
Best Practices
•	Use Terraform workspaces for multiple environments: 
•	terraform workspace new dev
•	terraform workspace select dev
•	Store the Terraform state file in AWS S3 for collaboration: 
•	terraform {
•	  backend "s3" {
•	    bucket = "your-terraform-state-bucket"
•	    key    = "terraform.tfstate"
•	    region = "us-east-1"
•	  }
•	}
•	Use Terraform Modules for reusable infrastructure.
•	Follow GitOps practices by storing Terraform scripts in a version-controlled repo.
