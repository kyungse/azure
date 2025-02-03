data "terraform_remote_state" "common" {
  backend = "azurerm"

  config = {
    resource_group_name  = var.resource_group_name
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    key                  = var.common_tfstate_key
  }
}

data "azurerm_resource_group" "rg" {
  name = data.terraform_remote_state.common.outputs.resource_group_name
}
