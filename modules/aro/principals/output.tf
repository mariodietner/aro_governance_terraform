output "application_client_id" {
  value = azuread_application.my_aro_app.client_id
}

output "application_object_id" {
  value = azuread_application.my_aro_app.object_id
}

output "service_principal_password" {
  #for safekeeping, store the password in a key vault
  value     = azuread_service_principal_password.sp_aro_app_pwd.value
  sensitive = true
}

output "redhatopenshift_client_id" {
  value = data.azuread_service_principal.redhatopenshift.client_id
}

output "redhatopenshift_object_id" {
  value = data.azuread_service_principal.redhatopenshift.object_id
}