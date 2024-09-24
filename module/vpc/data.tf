# check availability zones in subnets
data "aws_availability_zones" "available" {
  state = "available"
}