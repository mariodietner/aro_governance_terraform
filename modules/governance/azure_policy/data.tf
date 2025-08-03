data "azurerm_policy_definition_built_in" "tag_resoruces_policy" {
  display_name = "Add a tag to resources"
}

data "azurerm_policy_definition_built_in" "tag_resourcegroup_policy" {
  display_name = "Add a tag to resource groups"
}