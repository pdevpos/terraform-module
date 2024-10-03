# module "vpc" {
#   source = "./module/app"
#   instanceType = var.instance_type
#   projectName = var.project_name
#
# }
module "frontend" {
  source = "./module/provisioner"
  protocol_type = "ssh"
  instance_type = "t3.micro"
  ssh_user = var.ssh_user
  ssh_password = var.ssh_password
  component = "frontend"
  env = "dev"
  zone_id = var.zone_id
  route_record_type = var.record_type
}
# module "backend" {
#   source = "./module/provisioner"
#   protocol_type = "ssh"
#   instance_type = "t3.micro"
#   ssh_user = var.ssh_user
#   ssh_password = var.ssh_password
#   component = "backend"
#   env = "dev"
#   zone_id = var.zone_id
#   route_record_type = var.record_type
# }
# module "mysql" {
#   source = "./module/provisioner"
#   protocol_type = "ssh"
#   instance_type = "t3.micro"
#   ssh_user = var.ssh_user
#   ssh_password = var.ssh_password
#   component = "mysql"
#   env = "dev"
#   zone_id = var.zone_id
#   route_record_type = var.record_type
# }