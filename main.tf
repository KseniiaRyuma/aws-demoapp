terraform {
  required_version = ">= 0.11.1"
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "demo_ec2" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.aws_region}b"
  associate_public_ip_address = "true"
  tags {
    Name = "${var.name}"
    Owner = "${var.owner}"
    TTL = "${var.ttl}"
  }
  provisioner "local-exec" {
    command = "go run hello-world.go"
  }
}
