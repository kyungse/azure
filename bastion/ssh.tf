resource "azapi_resource_action" "ssh_public_key_gen" {
  type        = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  resource_id = azapi_resource.ssh_public_key.id
  action      = "generateKeyPair"
  method      = "POST"

  response_export_values = ["publicKey", "privateKey"]
}

resource "azapi_resource" "ssh_public_key" {
  type      = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  name      = var.ssh_public_key_name
  location  = data.azurerm_resource_group.rg.location
  parent_id = data.azurerm_resource_group.rg.id
}

resource "local_file" "private_key" {
  content         = azapi_resource_action.ssh_public_key_gen.output.privateKey
  filename        = pathexpand("~/.ssh/${var.ssh_public_key_name}")
  file_permission = "0600"
}

resource "local_file" "public_key" {
  content         = azapi_resource_action.ssh_public_key_gen.output.publicKey
  filename        = pathexpand("~/.ssh/${var.ssh_public_key_name}.pub")
  file_permission = "0644"
}
