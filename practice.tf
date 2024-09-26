module "vpc_mod" {
  source = "./module/practice_vpc"
  cidr_block = var.vpc_cidr_block
 igw_tag_name = var.igw_name
}