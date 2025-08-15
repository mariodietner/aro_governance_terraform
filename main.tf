resource "azurerm_resource_group" "aro_resource_group" {
  name     = var.resource_group
  location = var.location
  tags = var.tags
}

module "aro" {
  source="./modules/aro"

  name = var.name
  location = var.location
  resource_group = azurerm_resource_group.aro_resource_group.name
  subscription_id = var.subscription_id
  cluster_domain = var.cluster_domain
  domain_resource_group_name = var.domain_resource_group_name
  pull_secret = var.pull_secret
  tags = var.tags
}

module "azure_policies" {
  source = "./modules/governance/azure_policy"

  subscription_id = var.subscription_id

  depends_on = [module.aro]
}

module "compliance_operator" {
  source = "./modules/governance/compliance_operator"

  cluster_api_url = module.aro.apiserver_url
  resource_group = azurerm_resource_group.aro_resource_group.name
  cluster_name = var.name
  cluster_domain = var.cluster_domain

  depends_on = [module.aro]
}