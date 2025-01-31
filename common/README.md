## Common components

- Common components that create the resources basically required to provision Azure infrastructure and build a backend to manage Terraform state.

### How to provision
- Create resource group, storage account, container, and migrate tfstate file, which saves the provisioned state, from local to remote.
```zsh
# Don't remove the comments from backend.tf
$ terraform init       
$ terraform plan -var-file=config/custom.tfvars
$ terraform apply -var-file=config/custom.tfvars

# After provisioning a resource group, storage account, and container, migrate the local tfstate to remote.
# Remove the comments from backend.tf
$ terraform init -backend-config=config/backend.tfvars -migrate-state
```
