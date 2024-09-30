# create VPC
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  enable_dns_hostnames = true
tags = merge(
  var.common_tags,
  {
    Name = local.resource_name
  }
)
}