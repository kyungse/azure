# Key for accessing common, network, bastion resources
common_tfstate_key       = "common/terraform.tfstate"
network_tfstate_key      = "network/terraform.tfstate"

# Variables for k8s components
k8s_cluster_name                  = "kyungse-k8s-cluster"
dns_prefix                        = "kyungse"
node_count                        = 3
nodepool_name                     = "agentpool"
node_size                         = "Standard_B2s"
node_disk_size_gb                 = 30
network_service_cidr              = "10.0.3.0/24"
network_dns_service_ip            = "10.0.3.10"
log_analytics_workspace_name      = "kyungse-log-analytics-workspace"
log_analytics_workspace_sku       = "PerGB2018"
log_analytics_retention_in_days   = 30
