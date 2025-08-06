resource "azurerm_virtual_network" "aro_vnet" {
  name                = "aro-vnet"
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_subnet" "control_plane_subnet" {
  name                 = "control-plane-subnet"
  resource_group_name   = var.resource_group_name
  virtual_network_name  = azurerm_virtual_network.aro_vnet.name
  address_prefixes     = var.control_plane_subnet_prefixes
  service_endpoints    = var.control_plane_service_endpoints
}

resource "azurerm_subnet" "worker_subnet" {
  name                 = "worker-subnet"
  resource_group_name   = var.resource_group_name
  virtual_network_name  = azurerm_virtual_network.aro_vnet.name
  address_prefixes     = var.worker_subnet_prefixes
  service_endpoints    = var.worker_service_endpoints
}

resource "azurerm_network_security_group" "aronsg" {
  name                = "aro_nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_network_security_rule" "aro_inbound_api" {
  name                        = "aro-inbound-api"
  network_security_group_name = azurerm_network_security_group.aronsg.name
  resource_group_name         = var.resource_group_name
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "6443"
  source_address_prefix       = "0.0.0.0/0"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "aro_inbound_https" {
  name                        = "aro-inbound-https"
  network_security_group_name = azurerm_network_security_group.aronsg.name
  resource_group_name         = var.resource_group_name
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "0.0.0.0/0"
  destination_address_prefix  = "*"
}