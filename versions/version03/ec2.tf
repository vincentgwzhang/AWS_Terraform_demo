###########################################################
# 生成的资源设置
resource "aws_instance" "myweb_server" {
  ami           = "ami-084e8c05825742534"
  instance_type = "t3.micro"
  key_name      = "deeplearnaws-ssh-key"
  user_data     = file("${path.module}/ec2-userdata.sh")

  tags = {
    Name = "deeplearnaws-ec2-from-terraform"
    Version = "3.0"
  }
}