module "aws_vpc" {
  source = "./module/practice1"
  vpc_cidr = var.vpc_cidr
  env = var.environment
  common_tags = var.common_tags
  project_name = var.project_name
  public_subnets_cidrs = var.public_subnets_cidrs
  private_subnets_cidrs = var.private_subnets_cidrs
  database_subnets_cidrs = var.database_subnets_cidrs
}