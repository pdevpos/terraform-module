output "vpc_info" {
  value = module.vpc_mod.vpc
}
output "igw_info" {
  value = module.vpc_mod.igw
}
output "avz"{
  value = module.vpc_mod.av_region.names
}