module "ec2-web" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.2.1"

  # 生成数量
  count = 2

  name          = "${local.appName}-webserver-${count.index + 1}"
  ami           = data.aws_ami.komaami.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair

  # 指定网段生成
  subnet_id = module.vpc.public_subnets[count.index % length(module.vpc.public_subnets)]

  # 指定 Web 安全组
  vpc_security_group_ids = [module.web_server_sg.security_group_id]
  user_data     = file("${path.module}/ec2-userdata.sh")

  tags = {
    "Name" : "${local.appName}-webserver-${count.index + 1}"
  }
}