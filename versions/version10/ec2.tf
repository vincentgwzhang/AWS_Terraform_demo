###########################################################
# 生成的资源设置
resource "aws_instance" "myweb_server" {
  ami           = data.aws_ami.komaami.id
  instance_type = var.instance_type_map["develop"]
  key_name      = "deeplearnaws-ssh-key"
  user_data     = file("${path.module}/ec2-userdata.sh")
  vpc_security_group_ids = [aws_security_group.deeplearnaws-sg-web-ssh.id]


  for_each          = toset(data.aws_availability_zones.deeplearnaws_azones.names)
  availability_zone = each.key
  # count = 2

  tags = {
    "Name" = "deeplearnaws-tf-ec2-${each.key}"
    Version = "10.0"
  }
}