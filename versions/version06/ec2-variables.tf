# AWS Region
variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "eu-west-2"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t3.micro"  
}