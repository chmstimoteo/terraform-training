provider "google" {
  version     = "= 1.11.0"
  credentials = "./${var.project_codename}-credentials.json"
  project     = "${var.gcp_project_id}"
  region      = "${var.region}"
}
