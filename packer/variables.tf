variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "common_tfstate_key" {
  description = "The key of the common Terraform state file"
  type        = string
}

variable "network_tfstate_key" {
  description = "The key of the network Terraform state file"
  type        = string
}

variable "container_name" {
  description = "The name of the storage container"
  type        = string
}

variable "custom_image_vm_ip_name" {
  description = "The name of the public IP address for the custom image VM"
  type        = string
}

variable "custom_image_vm_nic_name" {
  description = "The name of the network interface for the custom image VM"
  type        = string
}

variable "custom_image_vm_name" {
  description = "The name of the custom image virtual machine"
  type        = string
}

variable "custom_image_vm_size" {
  description = "The size of the custom image virtual machine"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "custom_image_vm_disk_name" {
  description = "The name of the OS disk for the custom image VM"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the virtual machine"
  type        = string
  sensitive   = true
}

variable "custom_packer_image_id" {
  description = "The ID of the custom image created by Packer"
  type        = string
}
