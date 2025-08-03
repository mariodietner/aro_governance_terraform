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
  description = "The subscription id used for the role scope"
  type        = string
}

variable "tenant_id" {
  description = "The subscription id used for the role scope"
  type        = string
}