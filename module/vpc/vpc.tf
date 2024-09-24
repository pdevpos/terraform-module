resource "aws_vpc" "main" {
  cidr_block       = var.cidrBlock
  tags = merge(
    var.common_tags,
    {
  Name = "${var.projectName}-${var.env}"
  })
  }
