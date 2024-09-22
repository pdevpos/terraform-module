variable "ami"{
  type = string
  default = "ami-09c813fb71547fc4f"
}
variable "sg" {
  type = list
  default = ["sg-032f7910c194cf582"]
}
variable "instance_type"{
  type = string
  default = "t2.micro"
}
variable "tags" {
  type = map
  default = {
    Name = "test"
  }
}
