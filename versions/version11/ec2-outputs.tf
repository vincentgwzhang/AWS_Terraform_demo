# EC2 公有IP
# value = aws_instance.myweb_server.public_ip
#output "instance_publicip" {
#  value = [for instance in aws_instance.myweb_server : instance.public_ip]
#}

#output "instance_availability_zone" {
#  value = [for instance in aws_instance.myweb_server : instance.availability_zone]
#}

# 以上两种的循环是一样的

# 输出可用区一览
#output "deeplearnaws_azones" {
#  value = data.aws_availability_zones.deeplearnaws_azones.names
#}

# 可用区支持的 EC2 实例类型
#output "deeplearnaws_ec2_types" {
#  value = [for node in data.aws_ec2_instance_type_offerings.deeplearnaws_ec2_types: node]
#}