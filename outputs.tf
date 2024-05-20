output "kube_config" {
  value = azurerm_kubernetes_cluster.main.kube_config_raw
  sensitive = true
}

output "host" {
  value = azurerm_kubernetes_cluster.main.kube_config.0.host
  sensitive = true
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.main.kube_config.0.client_certificate
  sensitive = true
}

output "client_key" {
  value = azurerm_kubernetes_cluster.main.kube_config.0.client_key
  sensitive = true
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.main.kube_config.0.cluster_ca_certificate
  sensitive = true
}

output "vnet_name" {
  value = azurerm_virtual_network.main.name
}

