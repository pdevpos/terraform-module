vpc_cidr = "10.0.0.0/16"
environment = "dev"
project_name = "expense"
common_tags = {
  Project_name = "expense"
  Terraform = true
}
public_subnets_cidrs = ["10.0.4.0/24","10.0.6.0/24"]
private_subnets_cidrs = ["10.0.8.0/24","10.0.12.0/24"]
database_subnets_cidrs = ["10.0.14.0/24","10.0.16.0/24"]
is_vpc_required = false
target_vpc_id = ""

