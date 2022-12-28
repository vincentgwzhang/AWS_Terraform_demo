output "instance_publicip" {
  # EC2 公有IP
  # value = aws_instance.myweb_server.public_ip
  value = [for instance in aws_instance.myweb_server : instance.public_ip]
}

output "instance_availability_zone" {
  value = [for instance in aws_instance.myweb_server : instance.availability_zone]
}

# 以上两种的循环是一样的

output "deeplearnaws_azones" {
  # 输出可用区一览
  value = data.aws_availability_zones.deeplearnaws_azones.names
}

output "deeplearnaws_ec2_types" {
  # 可用区支持的 EC2 实例类型
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.deeplearnaws_ec2_types :
    az => details.instance_types
  }

  #value = data.aws_ec2_instance_type_offerings.deeplearnaws_ec2_types

}