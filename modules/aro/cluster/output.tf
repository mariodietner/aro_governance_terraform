output "console_url" {
  value = azurerm_redhat_openshift_cluster.aro_cluster.console_url
}

output "apiserver_url" {
  value = azurerm_redhat_openshift_cluster.aro_cluster.api_server_profile[0].url
}

output "apiserver_ip" {
  value = azurerm_redhat_openshift_cluster.aro_cluster.api_server_profile[0].ip_address
}

output "ip_address" {
    value = azurerm_redhat_openshift_cluster.aro_cluster.ingress_profile[0].ip_address
}