variable "vnet_id" {
  description = "The ID of the Azure virtual network where role assignments are scoped."
  type        = string
}

variable "service_principal_object_id_sp_aro_app" {
  description = "The object ID of the service principal for the aro app."
  type        = string
}

variable "service_principal_object_id_redhatopenshift" {
  description = "The object ID of the Azure AD service principal for Red Hat OpenShift."
  type        = string
}

variable "subscription_id" {
  description = "The subscription id used for the role scope"
  type        = string
}

variable "resource_group" {
  description = "The resource group name used for the role scope"
  type        = string
}
