resource "aws_vpc" "main" {
  cidr_block       = var.cidrBlock
  enable_dns_hostnames = true
  tags = merge(
    var.common_tags,
    {
  Name = "${var.projectName}-${var.env}"
  })
  }
