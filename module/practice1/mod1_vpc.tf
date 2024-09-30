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
# create public subnets
resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnets_cidrs)
  availability_zone = local.available_zones[count.index]
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnets_cidrs[count.index]
  tags = merge(
  var.common_tags,
    {
      Name = "${local.resource_name}-public-subnet-${count.index}"
    }
  )
}
# create private subnets
resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnets_cidrs)
  availability_zone = local.available_zones[count.index]
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnets_cidrs[count.index]
  tags = merge(
    var.common_tags,
    {
      Name = "${local.resource_name}-private-subnet-${count.index}"
    }
  )
}
# create database subnets
resource "aws_subnet" "database_subnets" {
  count = length(var.database_subnets_cidrs)
  availability_zone = local.available_zones[count.index]
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.database_subnets_cidrs[count.index]
  tags = merge(
    var.common_tags,
    {
      Name = "${local.resource_name}-database-subnet-${count.index}"
    }
  )
}

#create public route table
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.common_tags,
    {
      Name = "${local.resource_name}-public-route-table"
    }
  )
}
#create private  route table
resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.common_tags,
    {
      Name = "${local.resource_name}-private-route-table"
    }
  )
}
#create database route table
resource "aws_route_table" "db_route" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.common_tags,
    {
      Name = "${local.resource_name}-db-route-table"
    }
  )
}

