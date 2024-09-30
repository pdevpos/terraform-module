# create VPC
resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  enable_dns_hostnames = true
tags = merge(
  var.common_tags,
  {
    Name = local.resource_name
  }
)
}
#create Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.common_tags,
    {
    Name = "${local.resource_name}-igw"
  }
  )
}