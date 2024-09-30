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
# check availability zone in subnets
resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnets_cidrs)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnets_cidrs[count.index]
  tags = merge(
  var.common_tags,
    {
      Name = "${local.resource_name}-public-subnet-${count.index}"
    }
  )
}
