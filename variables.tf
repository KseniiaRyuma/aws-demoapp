variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "ID of the AMI to provision. Default is Ubuntu 14.04 Base Image"
  default     = "ami-2e1ef954"
}

variable "instance_type" {
  description = "type of EC2 instance to provision"
  default     = "t2.small"
}

variable "name" {
  description = "name to pass to Name tag"
  default     = "demo-app"
}

variable "owner" {
  description = "name of person creating"
  default     = "kseniia-ryuma"
}

variable "ttl" {
  description = "time to live for infrastructure in hours"
  default     = "1"
}

variable "allowed_ingress_cidr" {
  description = "list of cidrs to allow"
  default     = ["0.0.0.0/0"]
}

variable "ec2_count" {
  description = "number of ec2 instances to deploy"
  default     = 1
}
