terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "networking" {
  source = "./modules/networking"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  aws_region = var.aws_region
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  subnet_id = module.networking.public_subnet_id
  vpc_security_group_ids = [module.networking.security_group_id]
  key_name = var.key_name
  instance_type = var.instance_type
}

module "dns" {
  source = "./modules/dns"
  domain_name = var.domain_name
  instance_public_ip = module.ec2_instance.public_ip
}
