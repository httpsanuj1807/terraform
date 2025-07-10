provider "aws" {
  region     = "ap-south-1"
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_ACCESS_KEY
}

data "aws_instances" "instance-in-mumbai-region" {
  
}

data "aws_caller_identity" "owner-details" {}


output "mumbai-region-instance-ids" {
  value = data.aws_instances.instance-in-mumbai-region.private_ips
}
