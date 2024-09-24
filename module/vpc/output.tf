output "azs_region" {
  value = data.aws_availability_zones.available

}
output "aws_vpc"{
  value = aws_vpc.main
}