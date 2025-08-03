variable "openshift_cluster_name" {
  description = "The name of the Red Hat OpenShift cluster."
  type        = string
  default     = "examplearo"
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "cluster_domain" {
  description = "The domain for the OpenShift cluster."
  type        = string
  default     = "aro-example.com"
}

variable "cluster_version" {
  description = "The OpenShift version to deploy."
  type        = string
  default     = "4.19"
}

variable "pod_cidr" {
  description = "The CIDR for pods in the cluster."
  type        = string
  default     = "10.128.0.0/14"
}

variable "service_cidr" {
  description = "The CIDR for services in the cluster."
  type        = string
  default     = "172.30.0.0/16"
}

variable "control_plane_vm_size" {
  description = "VM size for the main profile."
  type        = string
  default     = "Standard_D8s_v3"
}

variable "control_plane_subnet_id" {
  description = "Subnet ID for the control plane profile."
  type        = string
}

variable "api_server_visibility" {
  description = "API server visibility."
  type        = string
  default     = "Public"
}

variable "ingress_visibility" {
  description = "Ingress profile visibility."
  type        = string
  default     = "Public"
}

variable "worker_vm_size" {
  description = "VM size for worker nodes."
  type        = string
  default     = "Standard_D4s_v3"
}

variable "worker_disk_size_gb" {
  description = "Disk size in GB for worker nodes."
  type        = number
  default     = 128
}

variable "worker_node_count" {
  description = "Number of worker nodes."
  type        = number
  default     = 3
}

variable "worker_subnet_id" {
  description = "Worker subnet ID."
  type        = string
}

variable "sp_client_id" {
  description = "The client ID for the service principal."
  type        = string
}

variable "sp_client_secret" {
  description = "The client secret for the service principal."
  type        = string
  sensitive   = true
}