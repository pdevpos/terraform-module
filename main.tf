module "vpc" {
  source = "./module/app"
  instanceType = var.instance_type
  projectName = var.project_name

}