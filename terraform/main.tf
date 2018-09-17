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

# Folder nested under another folder.
resource "google_folder" "team-abc" {
  display_name = "Team ABC"
  parent     = "${google_folder.carlos-coorporate-it.name}"
}

