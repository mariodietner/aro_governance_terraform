module "principals" {
  source="./principals"

  aad_application_display_name = "MY-ARO-DEMO-APP"
}

module "network" {
  source="./network"

  location = var.location
  resource_group_name = var.resource_group
  tags = var.tags
}

module "roles" {
  source="./roles"

  vnet_id = module.network.vnet_id
  service_principal_object_id_sp_aro_app = module.principals.application_service_principal_object_id
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
  cluster_domain = var.cluster_domain
  pull_secret = var.pull_secret
  tags = var.tags

  depends_on = [module.principals, module.network, module.roles]
}

module "dns" {
  source = "./dns"

  domain = var.cluster_domain
  resource_group_name = var.domain_resource_group_name
  apiserver_ip = module.cluster.apiserver_ip
  ingress_ip = module.cluster.ingress_ip

  depends_on = [module.cluster]
}