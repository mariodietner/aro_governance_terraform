resource "azurerm_resource_group" "aro_resource_group" {
  name     = var.resource_group
  location = var.location
  tags = {
    environment = "production"
    project = "demo"
  }
}

module "aro" {
  source="./modules/aro"

  name = var.name
  location = var.location
  resource_group = var.resource_group
  subscription_id = var.subscription_id
}

module "azure_policies" {
  source = "./modules/governance/azure_policy"

  subscription_id = var.subscription_id
}

module "compliance_operator" {
  source = "./modules/governance/compliance_operator"

  cluster_api_url = module.aro.apiserver_url
  resource_group = var.resource_group
  cluster_name = var.name
}