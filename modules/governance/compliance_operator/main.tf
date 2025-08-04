resource "terraform_data" "bootstrap" {
  input = {
    resource_group = var.resource_group
    cluster_name = var.cluster_name
    cluster_api_url = var.cluster_api_url
  }

  provisioner "local-exec" {
    on_failure = fail
    command = <<EOT
      bash bootstrap.sh
    EOT
    working_dir = "${path.module}/scripts"
    environment = {
      RESOURCE_GROUP = self.input.resource_group
      CLUSTER_NAME = self.input.cluster_name
      API_URL = self.input.cluster_api_url
    }
  }
}