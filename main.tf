terraform {
  required_version = ">= 0.11.1"
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "null_resource" "get-go" {
  provisioner "local-exec" {
    command = "sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get install golang"
  }
}

resource "aws_instance" "demo_ec2" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.aws_region}b"
  associate_public_ip_address = "true"
  depends_on = ["null_resource.get-go"]
  tags {
    Name = "${var.name}"
    Owner = "${var.owner}"
    TTL = "${var.ttl}"
  }
  provisioner "local-exec" {
    command = "go run hello-world.go"
  }
}
