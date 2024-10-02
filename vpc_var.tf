# variable "vpc_cidr" {
#   type = string
# }
# variable "vpc_tags" {
#   type = map
#   default = {}
# }
# variable "project_name"{
#   type = string
#   default = ""
# }
# variable "environment"{
#   type = string
# }
# variable "common_tags"{
#   type = map(string)
#   default = {}
# }
# variable "igw_tags" {
#   type = map
#   default = {}
# }
# variable "public_subnets_cidrs"{
#   type = list(string)
#   validation {
#     condition = length(var.public_subnets_cidrs) == 2
#     error_message = "please provide two public subnets"
#   }
# }
# variable "private_subnets_cidrs"{
#   type = list(string)
#   validation {
#     condition = length(var.private_subnets_cidrs) == 2
#     error_message = "please provide two private subnets"
#   }
# }
# variable "database_subnets_cidrs"{
#   type = list(string)
#   validation {
#     condition = length(var.database_subnets_cidrs) == 2
#     error_message = "please provide two private subnets"
#   }
# }
# variable "is_vpc_required"{}
# variable "target_vpc_id"{
#   type = string
#
# }