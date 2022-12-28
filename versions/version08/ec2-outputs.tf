output "instance_publicip" {
  # EC2 公有IP
  value = aws_instance.myweb_server.public_ip
}

output "instance_ami" {
  # EC2 公有IP
  value = aws_instance.myweb_server.ami
}