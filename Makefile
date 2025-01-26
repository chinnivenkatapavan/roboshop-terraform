dev-apply:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./env-dev/state.tfvars
	terraform apply -var-file=env-dev/main.tf -var token=$(token)

prod-apply:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./env-prod/state.tfvars
	terraform apply -var-file=env-prod/main.tf -var token=$(token)

dev-destroy:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./env-dev/state.tfvars
	terraform destroy -auto-approve -var-file=env-dev/main.tf -var token=$(token)

prod-destroy:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./env-prod/state.tfvars
	terraform destroy -auto-approve -var-file=env-prod/main.tf -var token=$(token)