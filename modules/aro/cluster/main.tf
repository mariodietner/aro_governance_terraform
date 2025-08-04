resource "azurerm_resource_group" "vm_resource_group" {
  name     = "${var.resource_group_name}-vms"
  location = var.location
  tags = {
    environment = "production"
    project = "demo"
  }
}

resource "azurerm_redhat_openshift_cluster" "aro_cluster" {
  name                = var.openshift_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name

  cluster_profile {
    domain  = var.cluster_domain
    version = var.cluster_version
    #pull_secret

    managed_resource_group_name = azurerm_resource_group.vm_resource_group.name
  }

  network_profile {
    pod_cidr     = var.pod_cidr
    service_cidr = var.service_cidr
  }

  main_profile {
    vm_size   = var.control_plane_vm_size
    subnet_id = var.control_plane_subnet_id
  }

  api_server_profile {
    visibility = var.api_server_visibility
  }

  ingress_profile {
    visibility = var.ingress_visibility
  }

  worker_profile {
    vm_size      = var.worker_vm_size
    disk_size_gb = var.worker_disk_size_gb
    node_count   = var.worker_node_count
    subnet_id    = var.worker_subnet_id
  }

  service_principal {
    client_id     = var.sp_client_id
    client_secret = var.sp_client_secret
  }

  tags = { 
    environment = "production"
    project = "demo"
    component = "cluster"
   }
}
