resource "aws_vpc" "main" {
  cidr_block       = var.cidrBlock
  enable_dns_hostnames = var.dns_hostnames
  tags = merge(
    var.common_tags,
    {
  Name = "${var.projectName}-${var.env}"
  })
  }
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.projectName}-${var.env}"
  }
}
