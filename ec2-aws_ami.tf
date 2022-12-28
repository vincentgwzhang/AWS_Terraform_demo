data "aws_ami" "komaami" {
  # 最新使用
  most_recent = true
  # amazon官方认证
  owners      = ["amazon"]

  # 镜像文件名称过滤
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-hvm-*-x86_64-gp2"]
  }

  # 根设备过滤条件
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}