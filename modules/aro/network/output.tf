output "control_plane_subnet_id" {
  description = "The ID of the control plane subnet."
  value       = azurerm_subnet.control_plane_subnet.id
}

output "worker_subnet_id" {
  description = "The ID of the worker subnet."
  value       = azurerm_subnet.worker_subnet.id
}

output "vnet_id" {
  description = "The ID of the virtual network."
  value       = azurerm_virtual_network.aro_vnet.id
}