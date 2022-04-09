resource "google_cloud_run_service" "cloud-run" {
  name     = var.name
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/yong-dev/helloworld@sha256:c5ed2fcac631200842fe6f5813ff393ea04e3520a67913c6642c12852f6a9ea9"

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

resource "google_cloud_run_service_iam_member" "allUsers" {
  service  = google_cloud_run_service.cloud-run.name
  location = google_cloud_run_service.cloud-run.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}
