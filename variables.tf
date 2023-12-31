variable "region" {
  default     = "us-central1"
  description = "Region of resources"
}

variable "availability_zone_names" {
  type    = list(string)
  default = ["us-central1-a", "us-central1-b"]
}

variable "project_id" {
  default = "abc-jobs-miso"
  description = "The ID of the Google Cloud project"
}

variable "bucket_state" {
  default = "abc-jobs-miso"
  description = "State ot terraform resources"
}

variable "api_gateway_name" {
  default = "api-gateway-abc-jobs"
  description = "Api gateway ABC jobs"
}

variable "load_balancer_name" {
  default = "a7f08b9fbb34c40dcb80f5a0a589cec7"
  description = "Ingress load balancer"
}

variable "domain_name" {
  default = "abc-jobs-miso-uniandes.com."
  description = "CDN domain"
}

variable "bucket_web_name" {
  default = "abc-jobs-miso-uniandes-g14"
  description = "Bucket web content"
}

variable "spanner_instance_name" {
  default = "miso-uniandes-g14"
  description = "Cloud spanner instance name"
}

variable "spanner_database_name" {
  default = "business-core"
  description = "Cloud spanner postgres database"
}

