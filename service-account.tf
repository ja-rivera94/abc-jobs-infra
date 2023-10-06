resource "google_service_account" "micro-service" {
  account_id = "micro-service"
}

resource "google_project_iam_member" "micro-service" {
  project = "${var.project_id}"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.micro-service.email}"
}

resource "google_service_account_iam_member" "micro-service" {
  service_account_id = google_service_account.micro-service.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:abc-jobs-miso.svc.id.goog[staging/micro-service]"
}
