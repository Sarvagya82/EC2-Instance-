variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the EC2 key pair"
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}
