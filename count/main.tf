provider "aws" {
  region     = "ap-south-1"
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_ACCESS_KEY
}

resource "aws_instance" "my-instance" {
  ami = var.AMI
  #instance_type = var.types-list[0] // accessing a variable from a list
  instance_type = var.TYPES_MAP["small"] // accessing a variable from a map
  count = 3
  tags = {
    Name = "my-instace"
  }
}


## we can create multiple ec2 instaces with the identical name but thats not the same case while creating security groups. One SG will be created anyway.

# resource "aws_security_group" "allow_tls" {
#   name        = "SG1"
#   description = "Allow TLS inbound traffic and all outbound traffic"
#   count = 2
# }


# aws_security_group.allow_tls[0]: Creation complete after 2s [id=sg-06fb6f5b8b090e28a] , CREATION SUCCESSFUl 
/* 
Error: creating Security Group (SG1): operation error EC2: CreateSecurityGroup, https response error StatusCode: 400, 
RequestID: e825f6ea-b4a1-4a0d-9796-2378618db60b, api error InvalidGroup.Duplicate:
The security group 'SG1' already exists for VPC 'vpc-0309799334bf37de2'
 
   with aws_security_group.allow_tls[1],
   on main.tf line 20, in resource "aws_security_group" "allow_tls":
   20: resource "aws_security_group" "allow_tls" {

*/



# this issue can be solved using count.index method


resource "aws_security_group" "allow_tls" {
  name        = "SG-${count.index}"
  description = "Allow TLS inbound traffic and all outbound traffic"
  count = 2
}


# now we will have two SGs, namely SG-1, SG-2


## using count.index in a more better and practical way
## in tfvars file USERS-NAME = [ "anuj", "manik", "virat" ]
resource "aws_iam_user" "iam-user" {
  name = var.USERS_NAME[count.index]
  count = 3
}


# we will get iam users with names this time instead of iam-1, iam-2 and so