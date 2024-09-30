variable "vpc_cidr" {
  type = string
}
variable "vpc_tags" {
  type = map
  default = {}
}
variable "project_name"{
  type = string
  default = ""
}
variable "environment"{
  type = string
}
variable "common_tags"{
  type = map
  default = {}
}
variable "igw_tags" {
  type = map
  default = {}
}