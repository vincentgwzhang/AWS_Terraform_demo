# AWS Region
variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "eu-west-2"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instance Type, t3.micro"
  type = string
  default = "t3.micro"  
}

variable "instance_type_batter" {
  description = "EC2 Instance Type, t2.medium"
  type = string
  default = "t2.medium"  
}

variable "instance_type_list" {
  description = "EC2 Instnace Type"
  type = list(string)
  default = ["t2.micro", "t3.micro", "t3.medium"]
}