data "docker_registry_image" "image" {
  name = "gcr.io/${var.project_id}/${var.name}:${var.service_version}"
}

data "google_container_registry_image" "project_registry_image" {
  name    = var.name
  project = var.project_id
  digest  = data.docker_registry_image.image.sha256_digest
}

resource "google_cloud_run_service" "cloud-run" {
  name     = var.name
  location = var.region
  template {
    spec {
      containers {
        image = data.google_container_registry_image.project_registry_image.image_url

      }
    }
    metadata {
      annotations = {
        "run.googleapis.com/launch-stage"  = "BETA"
        "autoscaling.knative.dev/maxScale" = var.max_instances
        "autoscaling.knative.dev/minScale" = var.min_instances
      }
    }
  }
  lifecycle {
    ignore_changes = [
      template.0.metadata.0.annotations
    ]
  }
  autogenerate_revision_name = true
  traffic {
    percent         = 100
    latest_revision = true
  }
}
