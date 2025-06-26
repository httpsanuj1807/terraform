variable "ACCESS_KEY" { }

variable "SECRET_ACCESS_KEY" {}

variable "AMI" { }

variable "ENV" {
  type = string
  default = "DEV"
}

variable "DEV_INSTANCE_TYPE" {
  type = list(string)
}

variable "PROD_INSTANCE_TYPE" {
  type = list(string)
}