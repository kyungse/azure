output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.resource_group.name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.resource_group.location
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.storage_account.name
}

output "storage_account_primary_endpoint" {
  description = "The primary endpoint of the storage account"
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
}

output "container_name" {
  description = "The name of the storage container"
  value       = azurerm_storage_container.storage_container.name
}

output "container_url" {
  description = "The URL of the storage container"
  value       = azurerm_storage_container.storage_container.id
}
