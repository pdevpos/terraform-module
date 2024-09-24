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
resource "aws_subnet" "subnet" {
  count = length(var.subnet_cidr_block)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr_block[count.index]
  tags = {
    Name = "${local.tag_name}-subnet"
  }
}

