# module "vpc_Aws" {
#   source = "./module/vpc"
#   cidrBlock = var.cidr_block
#   env = var.env
#   projectName = var.project_name
#   dns_hostnames = var.enable_dns_hostnames
#   subnet_cidr_block = var.subnet_cidr_block
# }