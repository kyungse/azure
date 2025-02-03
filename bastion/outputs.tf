output "bastion_vm_size" {
  description = "The size of the Bastion VM"
  value       = azurerm_linux_virtual_machine.bastion.size
}

output "bastion_vm_admin_username" {
  description = "The admin username of the Bastion VM"
  value       = azurerm_linux_virtual_machine.bastion.admin_username
}

output "bastion_vm_public_ip" {
  description = "The public IP address of the Bastion VM"
  value       = azurerm_public_ip.bastion_pip.ip_address
}

output "bastion_vm_private_ip" {
  description = "The private IP address of the Bastion VM"
  value       = azurerm_network_interface.bastion_network_interface.private_ip_address
}

output "bastion_subnet_id" {
  description = "The ID of the subnet for the Bastion host"
  value       = data.terraform_remote_state.network.outputs.public_subnet_id
}

output "bastion_ssh_private_key" {
  description = "The bastion private key for SSH access"
  value       = azapi_resource_action.ssh_public_key_gen.output.privateKey
  sensitive   = true
}

output "bastion_ssh_public_key" {
  description = "The bastion public key for SSH access"
  value       = azapi_resource_action.ssh_public_key_gen.output.publicKey
}
