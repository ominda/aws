variable "v_region" {
  type    = string
  default = "us-east-1"
}

variable "v_project" {
  type = string
}

variable "v_environment" {
  type = string
}

variable "v_owner" {
  type = string
}

variable "v_identifier" {
  type = string
}

# VPC variables
variable "v_primary_cidr_block" {
  type = string
}