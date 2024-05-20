resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_pet" "prefix" {
  prefix = var.resource_group_name_prefix
  length = 1
}

resource "azurerm_virtual_network" "main" {
  name                = "${random_pet.prefix.id}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "main" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_kubernetes_cluster" "main" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "myaksdns"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = "Standard_DS2_v2"
    vnet_subnet_id = azurerm_subnet.main.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
    dns_service_ip     = "10.2.0.10"
    service_cidr       = "10.2.0.0/24"
  }

}








