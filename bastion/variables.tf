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

variable "bastion_public_ip_name" {
  description = "The name of the public IP for the Bastion host"
  type        = string
}

variable "bastion_security_group_name" {
  description = "The name of the Bastion security group"
  type        = string
}

variable "bastion_name" {
  description = "The name of the Bastion host"
  type        = string
}

variable "bastion_size" {
  description = "The size of the Bastion host virtual machine."
  type        = string
  default     = "Standard_DS1_v2"
}

variable "bastion_disk_name" {
  description = "The name of the disk for the bastion host"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the bastion host"
  type        = string
}

variable "ssh_public_key_name" {
  description = "The name of the SSH public key"
  type        = string
}

variable "bastion_nic_name" {
  description = "The name of the Bastion network interface"
  type        = string
}
