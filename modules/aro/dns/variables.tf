variable "domain" {
  type = string
  description = "The domain under which the cluster will be made available."
}

variable "resource_group_name" {
  type = string
  description = "The resource group name under which the dns zone is hosted."
}

variable "apiserver_ip" {
  type = string
  description = "The cluster api server ip."
}

variable "ingress_ip" {
  type = string
  description = "The cluster server ingress ip."
}