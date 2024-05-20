variable "resource_group_name" {}
variable "location" {}
variable "subnet_name" {}
variable "aks_cluster_name" {}
variable "node_count" {}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

