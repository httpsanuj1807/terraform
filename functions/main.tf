provider "aws" {
  region     = "ap-south-1"
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_ACCESS_KEY
}

resource "aws_iam_user" "iam-new-hire" {
  name = "iam-new-hire"
}

resource "aws_iam_user_policy" "lb_ro" {
  name   = "ec2-user-policy"
  user   = aws_iam_user.iam-new-hire.name
  policy = file("./iam-user-policy.json")
}
