module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  # TF 名称
  name = "komaws-vpc"
  # IP 地址段
  cidr = "10.0.0.0/16"
  # 启用 DNS 主机
  enable_dns_hostnames = true
  # 启用 DNS 支持
  enable_dns_support = true

  vpc_tags = {
    # 赋予 tagName 标签
    "Name" = "${local.appName}-vpc-2022"
  }

  # 配置使用的 AZ 区
  azs = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  # 配置公有网段(会自动在路由表中配置IGW)
  public_subnets  = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
  # 配置私有网段
  private_subnets = ["10.0.20.0/24", "10.0.21.0/24", "10.0.22.0/24"]
  # 公有网段 TagName
  public_subnet_tags = {
    "Name" = "${local.appName}-public-subnets"
  }
  # 私有网段 TagName
  private_subnet_tags = {
    "Name" = "${local.appName}-private-subnets"
  }

  # 数据库子网设置
  database_subnets = ["10.0.30.0/24", "10.0.31.0/24", "10.0.32.0/24"]
  # 数据库子网组
  create_database_subnet_group = true
  # 数据库子网路由
  create_database_subnet_route_table = true
  # 数据库子网标签
  database_subnet_tags = {
    "Name" = "${local.appName}-database-subnets"
  }

  #########################################################
  # 练习环境，所有私有子网通过一个NAT网关
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  # 每个私有子网一个NAT网关
  # enable_nat_gateway     = true
  # single_nat_gateway     = false
  # one_nat_gateway_per_az = false

  # 每个可用区一个NAT网关
  # enable_nat_gateway = true
  # single_nat_gateway = false
  # one_nat_gateway_per_az = true
}