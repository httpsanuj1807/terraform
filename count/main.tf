provider "aws" {
  region     = "ap-south-1"
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_ACCESS_KEY
}

resource "aws_instance" "my-instance" {
  ami = var.AMI
  #instance_type = var.types-list[0] // accessing a variable from a list
  instance_type = var.TYPES_MAP["small"] // accessing a variable from a map
  tags = {
    Name = "my-instace"
  }
}


