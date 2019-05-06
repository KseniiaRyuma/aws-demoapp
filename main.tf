terraform {
  required_version = ">= 0.11.1"
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "demo_ec2" {
  ami               = "${var.ami_id}"
  instance_type     = "${var.instance_type}"
  availability_zone = "${var.av_zone}"

  network_interface {
    network_interface_id = "${aws_network_interface.demo_net.id}"
    device_index         = 0
  }

  tags {
    Name  = "${var.name}"
    owner = "${var.owner}"
    ttl   = "${var.ttl}"
  }
}

resource "aws_vpc" "demo_vpc" {
  cidr_block = "172.16.0.0/16"

  tags {
    Name  = "${var.name}"
    owner = "${var.owner}"
    ttl   = "${var.ttl}"
  }
}

resource "aws_subnet" "demo_subnet" {
  vpc_id            = "${aws_vpc.demo_vpc.id}"
  cidr_block        = "172.16.10.0/24"
  availability_zone = "${var.av_zone}"

  tags {
    Name  = "${var.name}"
    owner = "${var.owner}"
    ttl   = "${var.ttl}"
  }
}

resource "aws_network_interface" "demo_net" {
  subnet_id   = "${aws_subnet.demo_subnet.id}"
  private_ips = ["172.16.10.100"]

  tags {
    Name  = "${var.name}"
    owner = "${var.owner}"
    ttl   = "${var.ttl}"
  }
}
