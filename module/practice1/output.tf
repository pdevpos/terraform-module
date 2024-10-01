output "avz" {
  value = data.aws_availability_zones.available.names
}
output "default_vpc" {
  value = data.aws_vpc.selected
}