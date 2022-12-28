# https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest

# Web 公网安全组
module "web_server_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.2"
  name    = "public-subnets-sg-web"

  # 设置安全组所属VPC
  vpc_id = module.vpc.vpc_id

  # 入口规则
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # 出口规则
  egress_rules = ["all-all"]

  tags = {
    "Name" : "${local.appName}-public-subnets-sg-web"
  }
}

# App 私网安全组
module "app_server_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.2"
  name    = "private-subnets-sg-app"

  # 设置安全组所属VPC
  vpc_id = module.vpc.vpc_id

  # 入口规则
  ingress_rules       = ["http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  # 出口规则
  egress_rules = ["all-all"]

  tags = {
    "Name" : "${local.appName}-private-subnets-sg-app"
  }
}

# DB 私网安全组
module "db_server_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.2"
  name    = "private-subnets-sg-db"

  # 设置安全组所属VPC
  vpc_id = module.vpc.vpc_id

  # 入口规则
  ingress_rules       = ["mysql-tcp", "postgresql-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  # 出口规则
  egress_rules = ["all-all"]

  tags = {
    "Name" : "${local.appName}-private-subnets-sg-db"
  }
}

# SSH 公网安全组
module "ssh_server_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.2"
  name    = "public-subnets-sg-ssh"

  # 设置安全组所属VPC
  vpc_id = module.vpc.vpc_id

  # 入口规则
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # 出口规则
  egress_rules = ["all-all"]

  tags = {
    "Name" : "${local.appName}-public-subnets-sg-ssh"
  }
}


module "alb_web_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.2"
  name    = "public-subnets-sg-albweb"

  # 设置安全组所属VPC
  vpc_id = module.vpc.vpc_id

  # 入口规则
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # 出口规则
  egress_rules = ["all-all"]

  tags = {
    "Name" : "${local.appName}-public-subnets-sg-albweb"
  }
}