module "vpc" {
  source = "./module/app"
  instanceType = var.instance_type

}