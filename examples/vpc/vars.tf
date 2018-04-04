#
#  Assigned in terraform.tfvars
#
variable "aws_profile" {}
variable "aws_region" {}
variable "application" {}
variable "environment" {
  description = "Which environment are we managing"
  type = "string"
  default = "prod"
}
