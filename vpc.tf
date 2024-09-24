module "vpc_Aws" {
  source = "./module/vpc"
  cidrBlock = var.cidr_block
  env = var.env
}