module "provisioning_server" {
  source          = "./modules/cloud-run"
  name            = "sample-server"https://github.com/Yong-NNX/helloworld-infra/blob/main/cloudruns.tf
  service_version = var.service_version
  project_id      = var.service_project_id
  region          = var.region
}

