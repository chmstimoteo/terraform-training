variable "gcp_project_id" {
    default = "pythian-cft-training-timoteo"
}

variable "project_codename" {
    default = "terraform-training"
}

variable "region" {
    default = "us-east1"
}

variable "zone" {
    default = "us-east1-b"
}

variable "admin_email" {
  description = "Admin user email on Gsuite"
  default = "timoteo@pythian.com"
}

variable "organization_id" {
  description = "The organization id for the associated services"
  default = "222089017122"
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
  default = "014C66-7281AB-8582A2"
}

