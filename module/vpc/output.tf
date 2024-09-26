output "azs_region" {
  value = data.aws_availability_zones.available.names

}
output "avz_extr"{
  value = local.avz
}
output "vpc" {
  value = aws_vpc.vpc
}
