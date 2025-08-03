resource "azurerm_subscription_policy_assignment" "assign_tag_resources_policy" {
  name                 = "require-a-tag-on-resources"
  policy_definition_id = data.azurerm_policy_definition_built_in.tag_resoruces_policy.id
  subscription_id      = var.subscription_id
  parameters = jsonencode({
      "tagName" = {
      "value" = "environment"
      }
    })
}

resource "azurerm_subscription_policy_assignment" "assign_tag_resourcegroup_policy" {
  name                 = "require-a-tag-on-resource-groups"
  policy_definition_id = data.azurerm_policy_definition_built_in.tag_resourcegroup_policy.id
  subscription_id      = var.subscription_id
  parameters = jsonencode({
    "tagName" = {
      "value" = "environment"
    }
  })
}
