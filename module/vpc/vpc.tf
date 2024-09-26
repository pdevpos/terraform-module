resource "aws_vpc" "vpc" {
  cidr_block       = var.cidrBlock
  enable_dns_hostnames = var.dns_hostnames
   tags = merge(
    var.common_tags,
    {
  Name = local.tag_name
  })

  }
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${local.tag_name}-igw"
  }
}
resource "aws_subnet" "public_subnet" {
  count = length(var.subnet_cidr_block)
  availability_zone = local.avz[count.index]
  vpc_id     = aws_vpc.vpc.id
  map_public_ip_on_launch = true
cidr_block = var.subnet_cidr_block[count.index]
  tags = {
    Name = "${local.tag_name}-subnet-${count.index}"
  }
}
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.common_tags,
    {
    Name = "${local.tag_name}-public-route-table"
  })
}
resource "aws_route" "route" {
  route_table_id            = aws_route_table.route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}
