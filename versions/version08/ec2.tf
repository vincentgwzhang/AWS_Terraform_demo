###########################################################
# 生成的资源设置
resource "aws_instance" "myweb_server" {
  ami           = data.aws_ami.komaami.id
  instance_type = var.instance_type_list[1]
  key_name      = "deeplearnaws-ssh-key"
  user_data     = file("${path.module}/ec2-userdata.sh")
  vpc_security_group_ids = [aws_security_group.deeplearnaws-sg-web-ssh.id]

  tags = {
    Name = "deeplearnaws-ec2-from-terraform"
    Version = "8.0"
  }
}