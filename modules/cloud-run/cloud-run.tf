resource "google_cloud_run_service" "cloud-run" {
  name     = var.name
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/yong-dev/helloworld@sha256:195ab34be5a689ea2a6d968c156449db13961ba6710abee21ec3eb6134f34de0"

      }
    }
  }
  metadata {
    annotations = {
      "run.googleapis.com/launch-stage"  = "BETA"
      "autoscaling.knative.dev/maxScale" = var.max_instances
      "autoscaling.knative.dev/minScale" = var.min_instances
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
