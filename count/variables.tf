variable "ACCESS_KEY" { }

variable "SECRET_ACCESS_KEY" {}

variable "AMI" { }

variable "TYPES_LIST" {
  type = list 
}

variable "TYPES_MAP" {
  type = map
}

variable "USERS_NAME" {
  type = list(string)
}