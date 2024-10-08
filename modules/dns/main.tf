data "aws_route53_zone" "selected" {
  name         = var.domain_name
  private_zone = false
}

resource "aws_route53_record" "ec2_instance" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "ec2-instance.${var.domain_name}"
  type    = "A"
  ttl     = "300"
  records = [var.instance_public_ip]
}

resource "aws_route53_record" "ec2_docker" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "ec2-docker.${var.domain_name}"
  type    = "A"
  ttl     = "300"
  records = [var.instance_public_ip]
}
