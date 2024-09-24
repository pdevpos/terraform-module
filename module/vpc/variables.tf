variable "cidrBlock"{}
variable "common_tags"{
  type = map
  default = {
    Terraform = true
    Project = "expense"
    Environment = "dev"
  }
}
variable "projectName" {}
variable "env"{}