output "azs" {
  value = data.aws_availability_zones.available

}
output "aws_vpc"{
  value = aws_vpc.main
}