resource "azuread_application" "my_aro_app" {
  display_name = var.aad_application_display_name
  owners = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "sp_aro_app" {
  client_id = azuread_application.my_aro_app.client_id
  owners = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal_password" "sp_aro_app_pwd" {
  service_principal_id = azuread_service_principal.sp_aro_app.id
}

