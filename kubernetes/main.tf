resource "azurerm_log_analytics_workspace" "workspace" {
    name                = var.log_analytics_workspace_name
    location            = data.azurerm_resource_group.rg.location
    resource_group_name = data.azurerm_resource_group.rg.name
    sku                 = var.log_analytics_workspace_sku
    retention_in_days   = var.log_analytics_retention_in_days
}

resource "azurerm_log_analytics_solution" "solution" {
    solution_name         = "ContainerInsights"
    location              = azurerm_log_analytics_workspace.workspace.location
    resource_group_name   = data.azurerm_resource_group.rg.name
    workspace_resource_id = azurerm_log_analytics_workspace.workspace.id
    workspace_name        = azurerm_log_analytics_workspace.workspace.name

    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
}

resource "azurerm_kubernetes_cluster" "k8s" {
  location            = data.azurerm_resource_group.rg.location
  name                = var.k8s_cluster_name
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = var.nodepool_name
    vm_size    = var.node_size
    node_count = var.node_count
    os_disk_size_gb = var.node_disk_size_gb
    type       = "VirtualMachineScaleSets"
    vnet_subnet_id = data.terraform_remote_state.network.outputs.private_subnet_id
  }

  role_based_access_control_enabled = true

  network_profile {
    network_plugin    = "azure"
    service_cidr      = var.network_service_cidr
    dns_service_ip    = var.network_dns_service_ip
    load_balancer_sku = "standard"
  }

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id
  }
}
