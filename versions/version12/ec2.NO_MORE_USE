###########################################################
# 生成的资源设置
resource "aws_instance" "myweb_server" {
  ami           = data.aws_ami.komaami.id
  key_name      = "deeplearnaws-ssh-key"
  user_data     = file("${path.module}/ec2-userdata.sh")
  vpc_security_group_ids = [aws_security_group.deeplearnaws-sg-web-ssh.id]


  # Solution 1
  # for_each          = data.aws_ec2_instance_type_offerings.deeplearnaws_ec2_types
  # availability_zone = each.key
  #instance_type = var.instance_type_map[each.key]
  
  # Solution 2
  instance_type = var.instance_type_list[2]
  
  # Solution 3
  # count = 2

  tags = {
    #"Name" = "deeplearnaws-tf-ec2-${each.key}"
    "Name" = "deeplearnaws-tf-ec2"
    Version = "11.0"
  }
}