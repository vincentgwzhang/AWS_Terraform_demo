module "ec2-app" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.2.1"

  # 生成数量
  count = 3

  name          = "${local.appName}-appserver-${count.index + 1}"
  ami           = data.aws_ami.komaami.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair

  # 指定网段生成
  subnet_id = module.vpc.private_subnets[count.index % length(module.vpc.private_subnets)]

  # 指定 App 服务器安全组
  vpc_security_group_ids = [module.app_server_sg.security_group_id]

  tags = {
    "Name" : "${local.appName}-appserver-${count.index + 1}"
  }
}