output "instance_public_ip" {
  value = module.ec2_instance.public_ip
}

output "instance_public_dns" {
  value = module.ec2_instance.public_dns
}

output "ec2_instance_fqdn" {
  value = module.dns.ec2_instance_fqdn
}

output "ec2_docker_fqdn" {
  value = module.dns.ec2_docker_fqdn
}
