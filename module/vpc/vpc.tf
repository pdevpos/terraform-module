resource "aws_vpc" "main" {
  cidr_block       = var.cidrBlock
  enable_dns_hostnames = var.dns_hostnames
  tags = merge(
    var.common_tags,
    {
  Name = local.tag_name
  })
  }
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = local.tag_name
  }
}
# check availability zones in subnets
data "aws_availability_zones" "available" {
  state = "available"
}
