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

resource "google_container_registry" "backend_images" {
}

resource "google_storage_bucket" "angular_abc_jobs_miso_app" {
  name = "${var.bucket_web_name}"
  location = "${var.region}"
}

resource "google_compute_backend_bucket" "angular_abc_jobs_miso_app_cdn" {
  bucket_name = "${var.bucket_web_name}"
  name = "${var.bucket_web_name}-cdn"
  enable_cdn = true
}

resource "google_dns_managed_zone" "angular_abc_jobs_miso_app_dns" {
  name = "angular-abc-jobs-miso-app-cdn"
  dns_name = var.domain_name
}

data "google_compute_global_forwarding_rule" "angular_abc_jobs_miso_app_cdn" {
  name = google_compute_backend_bucket.angular_abc_jobs_miso_app_cdn.name
}


resource "google_dns_managed_zone" "us_central1_a" {
  name = "${var.availability_zone_names[0]}"
  dns_name = var.domain_name
}

resource "google_dns_managed_zone" "us_central1_b" {
  name = "${var.availability_zone_names[1]}"
  dns_name = var.domain_name
}


resource "google_dns_record_set" "angular_abc_jobs_miso_app_cdn_record" {
  name = "frontend.a.${google_dns_managed_zone.angular_abc_jobs_miso_app_dns.dns_name}"
  type = "A"
  ttl = 300
  rrdatas = [coalesce(data.google_compute_global_forwarding_rule.angular_abc_jobs_miso_app_cdn.ip_address, "192.168.1.1")]
  managed_zone = google_dns_managed_zone.angular_abc_jobs_miso_app_dns.name
}


resource "google_dns_record_set" "angular_abc_jobs_miso_app_cdn_record_b" {
  name = "frontend.b.${google_dns_managed_zone.angular_abc_jobs_miso_app_dns.dns_name}"
  type = "A"
  rrdatas = [coalesce(data.google_compute_global_forwarding_rule.angular_abc_jobs_miso_app_cdn.ip_address, "192.168.1.1")]
  managed_zone = google_dns_managed_zone.angular_abc_jobs_miso_app_dns.name
}