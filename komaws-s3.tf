module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.6.0"

  bucket = "${local.appName}-s3-vincent-20221228-bucket"
  acl    = "private"

  # 允许删除非空存储桶
  force_destroy = true

  versioning = {
    enabled = false
  }
}