dev-apply:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./env-dev/state.tfvars
	terraform apply -var-file=./env-dev/main.tf