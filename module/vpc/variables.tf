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
variable "subnet_cidr_block" {}