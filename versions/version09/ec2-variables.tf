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

variable "instance_type_map" {
  description = "t2: 0.0132_1_1, t3: 0.0472_2_4, c5: 0.202_4_8"
  type = map(string)
  default = {
    "develop" = "t2.micro"
    "uat" = "t3.medium"
    "production" = "c5.xlarge"
  }
}