resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
  project = var.project_id
}

resource "google_project_service" "container" {
  service = "container.googleapis.com"
  project = var.project_id
}

resource "google_project_service" "containerregistry" {
  service = "containerregistry.googleapis.com"
  project = var.project_id
}

resource "google_project_service" "deploymentmanager" {
  service = "deploymentmanager.googleapis.com"
  project = var.project_id
}

resource "google_project_service" "dns" {
  service = "dns.googleapis.com"
  project = var.project_id
}

resource "google_project_service" "logging" {
  service = "logging.googleapis.com"
  project = var.project_id
}

resource "google_project_service" "monitoring" {
  service = "monitoring.googleapis.com"
  project = var.project_id
}

resource "google_project_service" "oslogin" {
  service = "oslogin.googleapis.com"
  project = var.project_id
}

resource "google_project_service" "pubsub" {
  service = "pubsub.googleapis.com"
  project = var.project_id
}

resource "google_project_service" "replicapool" {
  service = "replicapool.googleapis.com"
  project = var.project_id
}

resource "google_project_service" "replicapoolupdater" {
  service = "replicapoolupdater.googleapis.com"
  project = var.project_id
}

resource "google_project_service" "resourceviews" {
  service = "resourceviews.googleapis.com"
  project = var.project_id
}

resource "google_project_service" "servicemanagement" {
  service = "servicemanagement.googleapis.com"
  project = var.project_id
}

resource "google_project_service" "sql-component" {
  service = "sql-component.googleapis.com"
  project = var.project_id
}

resource "google_project_service" "sqladmin" {
  service = "sqladmin.googleapis.com"
  project = var.project_id
}

resource "google_project_service" "storage-api" {
  service = "storage-api.googleapis.com"
  project = var.project_id
}