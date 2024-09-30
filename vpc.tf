# module "vpc_Aws" {
#   source = "./module/vpc"
#   cidrBlock = var.cidr_block
#   env = var.env
#   projectName = var.project_name
#   dns_hostnames = var.enable_dns_hostnames
#   public_subnet_cidr_block = var.public_subnet_cidr_block
#   private_subnet_cidr_block = var.private_subnet_cidr_block
#   db_subnet_cidr_block = var.db_subnet_cidr_block
# }