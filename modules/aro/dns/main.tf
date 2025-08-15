resource "azurerm_dns_a_record" "apiserver" {
  name                = local.api_domain
  zone_name           = data.azurerm_dns_zone.aro_dns_zone.name
  resource_group_name = data.azurerm_resource_group.dns_zone_rg.name
  ttl                 = 300
  records             = [var.apiserver_ip]
}

resource "azurerm_dns_a_record" "ingress_apps" {
  name                = local.ingress_domain
  zone_name           = data.azurerm_dns_zone.aro_dns_zone.name
  resource_group_name = data.azurerm_resource_group.dns_zone_rg.name
  ttl                 = 300
  records             = [var.ingress_ip]
}