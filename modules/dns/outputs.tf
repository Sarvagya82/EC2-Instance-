output "ec2_instance_fqdn" {
  value = aws_route53_record.ec2_instance.fqdn
}

output "ec2_docker_fqdn" {
  value = aws_route53_record.ec2_docker.fqdn
}
