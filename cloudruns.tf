module "provisioning_server" {
  source          = "./modules/cloud-run"
  name            = "helloworld"
  service_version = var.service_version
  project_id      = var.service_project_id
  region          = var.region
}

