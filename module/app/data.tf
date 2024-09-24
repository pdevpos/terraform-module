data "aws_ami" "example" {
  most_recent = true
  owners = ["973714476881"]
  filter {
    name   = "AMI name"
    values = ["RHEL-9-DevOps-Practice"]
  }
}