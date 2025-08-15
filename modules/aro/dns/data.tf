data "azurerm_resource_group" "dns_zone_rg" {
  name = var.resource_group_name
}

data "azurerm_dns_zone" "aro_dns_zone" {
  name = var.domain
  resource_group_name = data.azurerm_resource_group.dns_zone_rg.name
}