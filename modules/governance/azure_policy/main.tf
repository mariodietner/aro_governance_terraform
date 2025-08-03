resource "azurerm_subscription_policy_assignment" "assign_tag_resources_policy" {
  name                 = "assign-tag-resources-policy"
  policy_definition_id = data.azurerm_policy_definition_built_in.tag_resoruces_policy.id
  subscription_id      = var.subscription_id
}

resource "azurerm_subscription_policy_assignment" "assign_tag_resourcegroup_policy" {
  name                 = "assign-tag-resourcegroup-policy"
  policy_definition_id = data.azurerm_policy_definition_built_in.tag_resourcegroup_policy.id
  subscription_id      = var.subscription_id
}
