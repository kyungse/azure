variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "container_name" {
  description = "The name of the storage container"
  type        = string
}

variable "common_tfstate_key" {
  description = "The key of the common Terraform state file"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "public_subnet_name" {
  description = "The name of the public subnet"
  type        = string
}

variable "public_subnet_cidr_blocks" {
  description = "The cidr blocks of the public subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "private_subnet_name" {
  description = "The name of the private subnet"
  type        = string
}

variable "private_subnet_cidr_blocks" {
  description = "The cidr blocks of the private subnet"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "nat_gateway_name" {
  description = "The name of the NAT gateway"
  type        = string
}

variable "nat_public_ip_name" {
  description = "The name of the NAT public IP"
  type        = string
}

variable "private_subnet_nsg_name" {
  description = "The name of the network security group for the private subnet"
  type        = string
}
