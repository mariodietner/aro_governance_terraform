resource "azurerm_role_assignment" "role_network_sp_aro_app" {
  scope                = var.vnet_id
  role_definition_name = "Network Contributor"
  principal_id         = var.service_principal_object_id_sp_aro_app
}

resource "azurerm_role_assignment" "role_network_redhatopenshift" {
  scope                = var.vnet_id
  role_definition_name = "Network Contributor"
  principal_id         = var.service_principal_object_id_redhatopenshift
}

resource "azurerm_role_assignment" "role_subscription_redhatopenshift" {
  scope                = var.subscription_id
  role_definition_name = "Reader"
  principal_id         = var.service_principal_object_id_redhatopenshift
}

resource "azurerm_role_assignment" "role_resourcegroup_redhatopenshift" {
  scope                = data.azurerm_resource_group.cluster_resource_group.id
  role_definition_name = "Contributor"
  principal_id         = var.service_principal_object_id_redhatopenshift
}