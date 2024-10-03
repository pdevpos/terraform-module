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
}