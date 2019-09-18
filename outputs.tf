output "public_dns" {
  value = aws_instance.demo_ec2[count.index].public_dns
}

