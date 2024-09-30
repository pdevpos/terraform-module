# resource "aws_vpc" "vpc" {
#   cidr_block       = var.cidrBlock
#   enable_dns_hostnames = var.dns_hostnames
#    tags = merge(
#     var.common_tags,
#     {
#   Name = local.tag_name
#   })
# }
# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.vpc.id
#   tags = {
#     Name = "${local.tag_name}-igw"
#   }
# }
# # create a subnet
# resource "aws_subnet" "public_subnet" {
#   count = length(var.public_subnet_cidr_block)
#   availability_zone = local.avz[count.index]
#   vpc_id     = aws_vpc.vpc.id
#   map_public_ip_on_launch = true
# cidr_block = var.public_subnet_cidr_block[count.index]
#   tags = {
#     Name = "${local.tag_name}-public-subnet-${count.index}"
#   }
# }
# # create a private subnet
# resource "aws_subnet" "private_subnet" {
#   count = length(var.private_subnet_cidr_block)
#   availability_zone = local.avz[count.index]
#   vpc_id     = aws_vpc.vpc.id
#   cidr_block = var.private_subnet_cidr_block[count.index]
#   tags = {
#     Name = "${local.tag_name}-private-subnet-${count.index}"
#   }
# }
# # create a database subnet
# resource "aws_subnet" "database_subnet" {
#   count = length(var.db_subnet_cidr_block)
#   availability_zone = local.avz[count.index]
#   vpc_id     = aws_vpc.vpc.id
#   cidr_block = var.db_subnet_cidr_block[count.index]
#   tags = {
#     Name = "${local.tag_name}-database-subnet-${count.index}"
#   }
# }
# # create a public route table
# resource "aws_route_table" "public_route_table" {
#   vpc_id = aws_vpc.vpc.id
#   tags = merge(
#     var.common_tags,
#     {
#     Name = "${local.tag_name}-public-route-table"
#   })
# }
# # create private route table
# resource "aws_route_table" "private_route_table" {
#   vpc_id = aws_vpc.vpc.id
#   tags = merge(
#     var.common_tags,
#     {
#       Name = "${local.tag_name}-private-route-table"
#     })
# }
# # #create a db route table
# resource "aws_route_table" "db_route_table" {
#   vpc_id = aws_vpc.vpc.id
#   tags = merge(
#     var.common_tags,
#     {
#       Name = "${local.tag_name}-db-route-table"
#     })
# }
# resource "aws_eip" "elastic_ip" {
#
# }
# #create nat gateway
# resource "aws_nat_gateway" "nat" {
#   allocation_id = aws_eip.elastic_ip.id
#   subnet_id     = aws_subnet.public_subnet[0].id
#   tags = {
#     Name = "nat-gw"
#   }
#
# #  To ensure proper ordering, it is recommended to add an explicit dependency
# #   on the Internet Gateway for the VPC.
# #   depends_on = [aws_internet_gateway.igw]
# }
# # create a public route
# resource "aws_route" "public_route" {
#   route_table_id            = aws_route_table.public_route_table.id
#   destination_cidr_block    = "0.0.0.0/0"
#   gateway_id = aws_internet_gateway.igw.id
# }
# # create a private route
# resource "aws_route" "private_route" {
#   route_table_id            = aws_route_table.private_route_table.id
#   destination_cidr_block    = "0.0.0.0/0"
#   nat_gateway_id = aws_nat_gateway.nat.id
# }
# # create a db route
# resource "aws_route" "db_route" {
#   route_table_id            = aws_route_table.db_route_table.id
#   destination_cidr_block    = "0.0.0.0/0"
#   nat_gateway_id = aws_nat_gateway.nat.id
# }
#
# # associate route table and subnets
# resource "aws_route_table_association" "route_subnet_association" {
#   count = length(var.public_subnet_cidr_block)
#   subnet_id      = element(aws_subnet.public_subnet[*],count.index).id
#   route_table_id = aws_route_table.public_route_table.id
# }
# resource "aws_route_table_association" "private_route_subnet_association" {
#   count = length(var.private_subnet_cidr_block)
#   subnet_id      = element(aws_subnet.private_subnet[*],count.index).id
#   route_table_id = aws_route_table.private_route_table.id
# }
# resource "aws_route_table_association" "db_route_subnet_association" {
#   count = length(var.public_subnet_cidr_block)
#   subnet_id      = element(aws_subnet.database_subnet[*],count.index).id
#   route_table_id = aws_route_table.db_route_table.id
# }
#
#
