module "rds" {
  depends_on = [module.vpc]

  source  = "terraform-aws-modules/rds/aws"
  version = "5.2.2"

  # 数据库引擎
  engine         = "mysql"
  engine_version = "5.7.40"
  instance_class = "db.m5.xlarge"

  # 数据库实例标识符: 此名称在当前 AWS 区域中您的 AWS 账户拥有的所有数据库实例中必须是唯一的。
  identifier = "komaws-db"

  # 初始数据库设置
  db_name  = "blogdb" # 初始数据库名
  username = "root"
  password = "12345678"
  port     = 3306

  # 硬盘分配
  allocated_storage     = 10
  max_allocated_storage = 100
  # 非加密存储
  storage_encrypted = false
  # 多可用区部署
  multi_az = false
  # 数据库子网
  subnet_ids = module.vpc.database_subnets
  # 数据库安全组
  vpc_security_group_ids = [module.db_server_sg.security_group_id]
  
  db_subnet_group_name = module.vpc.vpc_id # "komaws-vpc"

  tags = {
    "Name" : "${local.appName}-rdb"
  }

  # DB parameter group
  family = "mysql5.7"
  # DB option group
  major_engine_version = "5.7"
  # Database Deletion Protection
  deletion_protection = false

  # 字符集设置
  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

  # 数据库实例标签
  db_instance_tags = {
    "Name" = "${local.appName}-db_instance"
  }
  # 数据库选项组标签
  db_option_group_tags = {
    "Name" = "${local.appName}-db_option_group"
  }
  # 数据库参数组标签
  db_parameter_group_tags = {
    "Name" = "${local.appName}-db_parameter_group"
  }
  # 数据库子网组标签
  db_subnet_group_tags = {
    "Name" = "${local.appName}-db_subnet_group"
  }
}