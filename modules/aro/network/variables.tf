variable "vnet_address_space" {
  description = "Address space(s) for the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/22"]
}

variable "location" {
  description = "Azure region where resources will be created."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "control_plane_subnet_prefixes" {
  description = "Address prefix(es) for the control plane subnet."
  type        = list(string)
  default     = ["10.0.0.0/23"]
}

variable "control_plane_service_endpoints" {
  description = "Service endpoints for the control plane subnet."
  type        = list(string)
  default     = ["Microsoft.Storage", "Microsoft.ContainerRegistry"]
}

variable "worker_subnet_prefixes" {
  description = "Address prefix(es) for the worker subnet."
  type        = list(string)
  default     = ["10.0.2.0/23"]
}

variable "worker_service_endpoints" {
  description = "Service endpoints for the worker subnet."
  type        = list(string)
  default     = ["Microsoft.Storage", "Microsoft.ContainerRegistry"]
}

variable "tags" {
  description = "tags that will be used in all resources created"
  type = map(string)
}