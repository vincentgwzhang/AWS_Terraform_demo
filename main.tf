terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.48"
    }

    # 空资源提供器
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }

  required_version = ">= 1.3.6"
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}

