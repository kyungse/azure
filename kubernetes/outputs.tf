output "kubernetes_cluster_name" {
  description = "The name of the Kubernetes cluster"
  value       = azurerm_kubernetes_cluster.k8s.name
}

output "kubernetes_cluster_id" {
  description = "The ID of the Kubernetes cluster"
  value       = azurerm_kubernetes_cluster.k8s.id
}

output "kubernetes_cluster_version" {
  description = "The version of Kubernetes used in the cluster"
  value       = azurerm_kubernetes_cluster.k8s.kubernetes_version
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.k8s.kube_config_raw
  sensitive = true
}