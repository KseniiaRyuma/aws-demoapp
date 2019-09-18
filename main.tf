terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "demo_ec2" {
  count                       = 2
  ami                         = var.ami_id
  instance_type               = var.instance_type
  availability_zone           = "${var.aws_region}b"
  associate_public_ip_address = "true"
  tags = {
    Name  = var.name
    Owner = var.owner
    TTL   = var.ttl
  }
}