output "env" {
  value = var.env
}
output "azs"{
  value = module.vpc_Aws.azs_region
}