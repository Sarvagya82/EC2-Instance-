variable "aws_region" {
  description = "The AWS region to create resources in"
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "key_name" {
  description = "Name of the EC2 key pair"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "domain_name" {
  description = "Domain name for the application"
}
