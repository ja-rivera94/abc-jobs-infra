resource "google_spanner_instance" "cloud_spanner_instance" {
  name = "${var.spanner_instance_name}"
  display_name = "${var.spanner_instance_name}"
  config = "regional-${var.region}"
  num_nodes    = 2
}

resource "google_spanner_database" "cloud_spanner_database_business_core" {
  instance = google_spanner_instance.cloud_spanner_instance.name
  name = "${var.spanner_database_name}"
  database_dialect = "POSTGRESQL"
}
