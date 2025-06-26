provider "aws" {
  region     = "ap-south-1"
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_ACCESS_KEY
}

resource "aws_security_group" "my-sec-grp" {
  name        = "my-sec-grp-${var.SG_VERSION}"
  description = "SG created by TF"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_app_port" {
  security_group_id = aws_security_group.my-sec-grp.id
  cidr_ipv4         = var.CIDR_BLOCK
  from_port         = var.APP_PORT
  ip_protocol       = "tcp"
  to_port           = var.APP_PORT
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_port" {
  security_group_id = aws_security_group.my-sec-grp.id
  cidr_ipv4         = var.CIDR_BLOCK
  from_port         = var.SSH_PORT
  ip_protocol       = "tcp"
  to_port           = var.SSH_PORT
}

resource "aws_vpc_security_group_ingress_rule" "allow_ftp_port" {
  security_group_id = aws_security_group.my-sec-grp.id
  cidr_ipv4         = var.CIDR_BLOCK
  from_port         = var.FTP_PORT
  ip_protocol       = "tcp"
  to_port           = var.FTP_PORT
}

resource "aws_instance" "my-instance" {
  ami           = var.AMI
  instance_type = var.INSTANCE_TYPE
  vpc_security_group_ids = [aws_security_group.my-sec-grp.id]
  tags = {
    Name = "my-instance"
  }
}
