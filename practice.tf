module "vpc_mod" {
  source = "./module/practice_vpc"
  cidr_block = var.vpc_cidr_block
 igw_tag_name = var.igw_name
  vpc_tag_name = var.vpc_tag_name
  public_subnets = var.public_subnets
  public_subnet_tag_name = var.public_subnet_tag_name
}