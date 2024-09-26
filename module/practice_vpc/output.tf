output "vpc" {
  value = aws_vpc.vpc
}
output "igw"{
  value = aws_internet_gateway.igw
}
output "av_region"{
  value = data.aws_availability_zones.zone
}