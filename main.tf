module "vpc" {
  source = "./module/app"
  instanceType = var.instance_type
  projectName = var.project_name
  common_tags = var.common_tags
}