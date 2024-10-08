Live Link : 
ec2_docker_fqdn = "ec2-docker.awswordpress.me"
ec2_instance_fqdn = "ec2-instance.awswordpress.me"

Https live link : https://ec2-docker.awswordpress.me
Https live link : https://ec2-instance.awswordpress.me

# Terraform AWS Infrastructure Deployment Documentation

## Project Overview
This project uses Terraform to deploy an AWS infrastructure consisting of an EC2 instance with Docker and NGINX, along with the necessary networking components and DNS configuration.

## Prerequisites
- AWS account with appropriate permissions
- Terraform installed (version 0.12+)
- AWS CLI configured with your credentials
- A registered domain name (in this case, awswordpress.me)

## Project Structure
```
project_root/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
│
├── modules/
│   ├── ec2_instance/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── networking/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── dns/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
└── userdata/
    └── install_docker_nginx.sh
```

## Implementation Steps

### 1. Set Up Project Structure
- Created the directory structure as shown above
- Initialized each module with its respective .tf files

### 2. Configure Provider and Modules
In `main.tf`:
- Defined the AWS provider
- Called each module (networking, ec2_instance, dns) with necessary parameters

### 3. Define Variables
In `variables.tf`:
- Declared variables for reusable values (e.g., region, VPC CIDR, domain name)

### 4. Create Networking Module
In `modules/networking/`:
- Defined VPC, subnet, internet gateway, route table, and security group

### 5. Create EC2 Instance Module
In `modules/ec2_instance/`:
- Defined EC2 instance resource
- Created and attached Elastic IP
- Included user data script for Docker and NGINX installation

### 6. Create DNS Module
In `modules/dns/`:
- Set up Route 53 records for subdomains

### 7. Define Outputs
In `outputs.tf`:
- Specified outputs like public IP and DNS names

### 8. Create User Data Script
In `userdata/install_docker_nginx.sh`:
- Wrote script to install and configure Docker and NGINX on the EC2 instance

### 9. Configure Domain in Namecheap
- Updated nameservers in Namecheap to point to AWS Route 53

### 10. Terraform Execution
- Ran `terraform init` to initialize the working directory
- Used `terraform plan` to preview changes
- Applied changes with `terraform apply`

### 11. Verification
- Checked AWS Console to confirm resource creation
- Verified DNS propagation using online tools
- Tested subdomain accessibility

## Key Components
- VPC with public subnet
- EC2 instance with Elastic IP
- Security group allowing inbound traffic on ports 80, 443, and 22
- Route 53 DNS records for subdomains
- Docker container running on EC2 instance
- NGINX configured for domain-based routing

## Challenges and Solutions
- DNS Propagation: Waited for nameserver changes to propagate before proceeding
- Modular Approach: Organized code into modules for better maintainability
- Security Considerations: Implemented security group rules to restrict access
