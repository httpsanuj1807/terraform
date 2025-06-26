variable "ACCESS_KEY" { }

variable "SECRET_ACCESS_KEY" {}

variable "APP_PORT" { }

variable "SSH_PORT" { }

variable "FTP_PORT" { }

variable "CIDR_BLOCK" { }

variable "AMI" { }

variable "INSTANCE_TYPE" { 
    default = "t2.micro"
}

variable "SG_VERSION" { }
