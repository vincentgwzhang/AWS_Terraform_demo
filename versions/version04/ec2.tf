###########################################################
# 生成的资源设置
resource "aws_instance" "myweb_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "deeplearnaws-ssh-key"
  user_data     = file("${path.module}/ec2-userdata.sh")

  tags = {
    Name = "deeplearnaws-ec2-from-terraform"
    Version = "4.0"
  }
}