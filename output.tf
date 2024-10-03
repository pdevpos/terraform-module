# output "vpc_info" {
#   value = module.vpc_mod.vpc
# }
# output "igw_info" {
#   value = module.vpc_mod.igw
# }
# output "avz"{
#   value = module.vpc_mod.av_region
# # }
# output "vpc_info" {
#   value = module.vpc_Aws.vpc
# }
# output "out_avz_info" {
#   value = module.aws_vpc.avz
# }
# output "aws_vpc_info" {
#   value = module.aws_vpc.default_vpc
# }
# output "info" {
#   value = module.frontend.data_ami
# }

output "ssh_user" {
  value = module.frontend
}
output "zone_id" {
  value = module.frontend.info
}

