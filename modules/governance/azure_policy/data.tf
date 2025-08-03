data "azurerm_policy_definition_built_in" "tag_resoruces_policy" {
  display_name = "Require a tag on resources"
}

data "azurerm_policy_definition_built_in" "tag_resourcegroup_policy" {
  display_name = "Require a tag on resource groups"
}