data "azuread_service_principal" "redhatopenshift" {
  // This is the Azure Red Hat OpenShift RP service principal id, considered to have that same client_id, at this time.
  client_id = "f1dd0a37-89c6-4e07-bcd1-ffd3d43d8875"
}