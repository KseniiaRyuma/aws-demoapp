terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "demo_ec2" {
  count                       = var.ec2_count
  ami                         = var.ami_id
  instance_type               = var.instance_type
  availability_zone           = "${var.aws_region}b"
  security_groups             = ["${aws_security_group.demo-sg.name}"]
  associate_public_ip_address = "true"
  tags = {
    Name  = var.name
    Owner = var.owner
    TTL   = var.ttl
  }
}

resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "Web Security Group"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_ingress_cidr
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ingress_cidr
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name  = var.name
    Owner = var.owner
    TTL   = var.ttl
  }
}
