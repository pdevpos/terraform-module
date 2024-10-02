env=$1
action=$2
rm -rf .terraform/terraform.tfstate
terraform init -backend-config=${env}-state/main.tfvars
terraform $action -var-file=${env}-state/state.tfvars