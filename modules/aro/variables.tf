variable "name" {
  description = "The cluster name."
  type        = string
}

variable "resource_group" {
  description = "The cluster name."
  type        = string
}

variable "location" {
  description = "The azure region to deploy to."
  type        = string
}

variable "subscription_id" {
  description = "The subscription id used for the role scope."
  type        = string
}

variable "tags" {
  description = "Tags that will be used in all resources created."
  type =        map(string)
}

variable "cluster_domain" {
  type = string
  description = "The external domain, under which the cluster will be made available."
}

variable "domain_resource_group_name" {
  type = string
  description = "The external domain, under which the cluster will be made available."
}

variable "pull_secret" {
  type = string
  description = "The pull secret as plain string."
}