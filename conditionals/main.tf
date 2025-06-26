provider "aws" {
  region     = "ap-south-1"
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_ACCESS_KEY
}

resource "aws_instance" "my-instance" {
  ami = var.AMI
  instance_type = var.ENV == "DEV" ? var.DEV_INSTANCE_TYPE[0] : var.PROD_INSTANCE_TYPE[0]
  tags = {
    Name = "my-instace"
  }
}



## we can also use != , && condition as well