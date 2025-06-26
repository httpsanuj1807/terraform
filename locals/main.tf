provider "aws" {
  region     = "ap-south-1"
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_ACCESS_KEY
}


locals  {
  OSDM_TEAM_TAGS = {
    team = "OSDM"
    createdAt = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  } 
}

resource "aws_security_group" "SG-1" {
  name        = "SG-1"
  tags = local.OSDM_TEAM_TAGS
}


resource "aws_security_group" "SG-2" {
  name        = "SG-2"
  tags = local.OSDM_TEAM_TAGS
}

