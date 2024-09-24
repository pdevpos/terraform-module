locals {
  tag_name = "${var.VPC_name}-${var.env}"
  avz = slice(data.aws_availability_zones.available.names,0 ,2)
}