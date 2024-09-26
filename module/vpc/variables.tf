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
variable "dns_hostnames" {}
variable "public_subnet_cidr_block" {}
variable "private_subnet_cidr_block" {}
variable "db_subnet_cidr_block" {}
