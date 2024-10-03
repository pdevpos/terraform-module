output "data_ami" {
  value = data.aws_ami.ami.image_id
}
output "info" {
  value = var.zone_id
}





