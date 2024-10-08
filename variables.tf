# variable "env" {}
# variable "instance_type"{}
# variable "cidr_block" {}
# variable "project_name" {}
# variable "enable_dns_hostnames"{}
# variable "public_subnet_cidr_block"{}
# variable "private_subnet_cidr_block" {}
# variable "db_subnet_cidr_block"{}


variable "env"{
  type = string
  default = ""
}
variable "protocol_type" {
  type = string
  default = ""
}
variable "ssh_user" {
  type = string
}
variable "ssh_password" {
  type = string
}
variable "instance_type" {
  type = string
  default = ""
}
variable "component" {
  type = string
  default = ""
}
variable "zone_id" {
  type = string
  default = ""
}
variable "record_type" {
  type = string
  default = ""
}