module "vpc_Aws" {
  source = "./module/vpc"
  cidrBlock = var.cidr_block
  env = var.env
  projectName = var.project_name
}