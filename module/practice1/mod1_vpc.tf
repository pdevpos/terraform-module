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
# create public route and attach igw
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}
# create elastic ip address
resource "aws_eip" "lb" {
  domain   = "eip"
}
#create nat gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public_subnets[0].id
  tags = merge(
    var.common_tags,
    {
      Name = "${local.resource_name}-nat-gw"
    }
  )
  depends_on = [aws_internet_gateway.igw]
}
# create private route and attach nat
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gw.id
}
# create db route and attach nat
resource "aws_route" "db_route" {
  route_table_id         = aws_route_table.db_route.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gw.id
}
# associate public subnets and public route table
resource "aws_route_table_association" "public_assoc_route_table" {
  subnet_id      = aws_subnet.public_subnets.id
  route_table_id = aws_route_table.public_route.id
}
# associate private subnets and private route table
resource "aws_route_table_association" "private_assoc_route_table" {
  subnet_id      = aws_subnet.private_subnets.id
  route_table_id = aws_route_table.private_route.id
}
# associate db subnets and db route table
resource "aws_route_table_association" "db_assoc_route_table" {
  subnet_id      = aws_subnet.database_subnets.id
  route_table_id = aws_route_table.db_route.id
}
