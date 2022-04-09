variable "environment" {
  description = "Name of the current deployment environment."
  type        = string
}

#-------------------------------------------
# Common settings
#-------------------------------------------
variable "region" {
  description = "Region"
}

variable "create_app_engine" {
  description = "Create initial App Engine (cannot be removed)"
  default     = true
}

variable "app_engine_location" {
  description = "App Engine location (eu-north1 or europe-west)"
  default     = "eu-north1"
}

variable "service_project_id" {
  description = "Project id for this project"
}

variable "subnetwork_name" {
  description = "Subnetwork name from the hosting project"
}

variable "network_name" {
  description = "Network name from the hosting project"
}

variable "host_network_project_id" {
  description = "Hosting project for VPC and FW rules"
}

variable "host_dns_project_id" {
  description = "DNS hosting project"
}

variable "dns_public_zone_name" {
  description = "Name of the public zone in the DNS hosting project"
}

#-------------------------------------------
# Generic service settings:
#-------------------------------------------
variable "service_version" {
  type        = string
  description = "The version tag of all services"
  default     = "latest"
}

variable "env" {
  description = "environment"
}

#-------------------------------------------
# Hello World Service settings:
#-------------------------------------------
variable "helloworld_image" {
  type        = string
  description = "Image for hello world service"
  default     = "helloworld"
}
