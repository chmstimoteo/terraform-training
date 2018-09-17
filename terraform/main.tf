provider "google" {
  version     = "= 1.11.0"
  credentials = "./${var.project_codename}-credentials.json"
  project     = "${var.gcp_project_id}"
  region      = "${var.region}"
}

#provider "gsuite" {
#  credentials             = "./${var.project_codename}-credentials.json"
#  impersonated_user_email = "${var.admin_email}"
#
#  oauth_scopes = [
#    "https://www.googleapis.com/auth/admin.directory.group",
#    "https://www.googleapis.com/auth/admin.directory.group.member",
#  ]
#}

# Top-level folder under an organization.
resource "google_folder" "carlos-coorporate-it" {
  display_name = "Coorporate IT Department"
  parent     = "organizations/${var.organization_id}"
}

resource "google_folder" "carlos-finance" {
  display_name = "Finance Department"
  parent     = "organizations/${var.organization_id}"
}

resource "google_project" "my-project-in-a-folder-2" {
  name = "My Project 3"
  project_id = "finance-project-2"
  folder_id  = "${google_folder.carlos-finance.name}"
}

# Folder nested under another folder.
resource "google_folder" "team-abc" {
  display_name = "Team ABC"
  parent     = "${google_folder.carlos-coorporate-it.name}"
}

resource "google_compute_network" "network" {
  name                    = "${var.network_name}"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
  project                 = "${var.gcp_project_id}"
}

resource "google_compute_subnetwork" "subnetwork" {
  count = "${length(var.subnets)}"

  name                     = "${lookup(var.subnets[count.index], "subnet_name")}"
  ip_cidr_range            = "${lookup(var.subnets[count.index], "subnet_ip")}"
  region                   = "${lookup(var.subnets[count.index], "subnet_region")}"
  private_ip_google_access = "${lookup(var.subnets[count.index], "subnet_private_access", false)}"
  network                  = "${google_compute_network.network.name}"
  project                  = "${var.gcp_project_id}"

  secondary_ip_range = "${var.secondary_ranges[lookup(var.subnets[count.index], "subnet_name")]}"
}

resource "google_compute_shared_vpc_host_project" "shared_vpc_host" {
  count   = "${var.shared_vpc_host == "true" ? 1 : 0}"
  project = "${var.gcp_project_id}"
}

module "logsink" {
  source           = "github.com/terraform-google-modules/terraform-google-log-export"
  name             = "my-logsink"
  folder           = "633907074872"
  filter           = "resource.type = gce_instance"
  
  bigquery = {
    name    = "my_logsink_bq"
    project = "finance-project-2"
  }
}
