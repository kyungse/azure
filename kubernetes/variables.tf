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

variable "network_tfstate_key" {
  description = "The key of the network Terraform state file"
  type        = string
}

variable "k8s_cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix for the Kubernetes cluster"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the Kubernetes cluster"
  type        = number
}

variable "nodepool_name" {
  description = "The name of the agents node pool"
  type        = string
}

variable "node_size" {
  description = "The size of the nodes in the Kubernetes cluster"
  type        = string
}

variable "node_disk_size_gb" {
  description = "The disk size of the nodes in the Kubernetes cluster"
  type        = number
}

variable "network_service_cidr" {
  description = "The CIDR block for the Kubernetes network"
  type        = string
}

variable "network_dns_service_ip" {
  description = "The IP address for the Kubernetes DNS service"
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics workspace"
  type        = string
}

variable "log_analytics_workspace_sku" {
  description = "The SKU of the Log Analytics workspace"
  type        = string
}

variable "log_analytics_retention_in_days" {
  description = "The retention period for the Log Analytics workspace"
  type        = number
}
