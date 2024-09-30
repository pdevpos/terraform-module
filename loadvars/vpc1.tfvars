vpc_cidr = "10.0.0.0/16"
environment = "dev"
project_name = "expense"
common_tags = {
  Project_name = "expense"
  Terraform = true
}
public_subnets_cidrs = ["10.0.4.0/24"]

