env=$1
action=$2
if [ -z "" ]; then
  echo "Input env is missing"
fi
if [ -z "" ]; then
  echo "Input action is missing"
fi
rm -rf .terraform/terraform.tfstate
terraform init -backend-config=${env}-state/main.tfvars
terraform $action -var-file=${env}-state/state.tfvars