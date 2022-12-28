output "instance_publicip" {
  # EC2 公有IP
  # value = aws_instance.myweb_server.public_ip
  value = [for instance in aws_instance.myweb_server : instance.public_ip]
}

output "instance_availability_zone" {
  value = aws_instance.myweb_server[*].availability_zone
}