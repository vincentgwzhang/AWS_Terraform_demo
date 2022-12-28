terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.48"
    }
  }

  required_version = ">= 1.3.6"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

###########################################################
# 生成的资源设置
resource "aws_instance" "myweb_server" {
  ami           = "ami-084e8c05825742534"
  instance_type = "t3.micro"

  tags = {
    Name = "deeplearnaws-ec2-from-terraform"
    Version = "1.0"
  }
}