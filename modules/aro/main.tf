module "principals" {
  source="./principals"

  aad_application_display_name = "MY-ARO-DEMO-APP"
}

module "network" {
  source="./network"

  location = var.location
  resource_group_name = var.resource_group
}

module "roles" {
  source="./roles"

  vnet_id = module.network.vnet_id
  service_principal_object_id_sp_aro_app = module.principals.application_object_id
  service_principal_object_id_redhatopenshift = module.principals.redhatopenshift_object_id
  subscription_id = var.subscription_id
  resource_group = var.resource_group

  depends_on = [module.principals, module.network]
}

module "cluster" {
  source="./cluster"
  openshift_cluster_name = var.name
  location = var.location
  resource_group_name = var.resource_group
  control_plane_subnet_id = module.network.control_plane_subnet_id
  worker_subnet_id = module.network.worker_subnet_id
  sp_client_id = module.principals.application_client_id
  sp_client_secret = module.principals.service_principal_password

  depends_on = [module.principals, module.network, module.roles]
}