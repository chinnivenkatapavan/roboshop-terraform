default:
	git pull

dev-apply:
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./env-dev/state.tfvars
	terraform apply -var-file=env-dev/main.tf

prod-apply:
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./env-prod/state.tfvars
	terraform apply -var-file=env-prod/main.tf