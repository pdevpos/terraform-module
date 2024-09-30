variable "vpc_cidr" {}
variable "env"{}
variable "common_tags"{
  default = {
    Project_name = "expense"
    Terraform = true
  }
}
variable "project_name" {}

