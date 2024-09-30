variable "vpc_cidr" {
  type = string
}
variable "vpc_tags" {
  type = map
  default = {}
}
variable "project_name"{
  type = string
}
variable "environment"{
  type = string
}
variable "common_tags"{
  type = map
}