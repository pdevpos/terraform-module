resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_tag_name
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.igw_tag_name
  }
}
resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnets)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnets[count.index]

  tags = {
    Name = var.public_subnet_tag_name
  }
}