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

variable "network_name" {
  description = "The name of the network being created"
  default = "pythian-timoteo-network"
}

variable "subnets" {
  type        = "list"
  description = "The list of subnets being created"
  default     = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name           = "subnet-02"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = "us-west1"
      subnet_private_access = true
      subnet_flow_logs      = true
    },
  ]
}

variable "secondary_ranges" {
  type        = "map"
  description = "Secondary ranges that will be used in some of the subnets"
  default     = {
    subnet-01 = [
      {
        range_name    = "subnet-01-secondary-01"
        ip_cidr_range = "192.168.64.0/24"
      },
    ]

    subnet-02 = []
  }
}


variable "shared_vpc_host" {
  type        = "string"
  description = "Makes this project a Shared VPC host if 'true' (default 'false')"
  default     = "false"
}
