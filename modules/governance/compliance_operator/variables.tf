variable "cluster_api_url" {
  type = string
  description = "The cluster APU url."
}

variable "resource_group" {
  type = string
  description = "The cluster resource group."
}

variable "cluster_name" {
  type = string
  description = "The resource name of the cluster."
}

variable "cluster_domain" {
  type = string
  description = "The external domain, under which the cluster will be made available."
}