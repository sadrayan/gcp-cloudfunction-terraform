variable "project_id" {
  type        = string
  description = "GCP Project in which the resources are created."
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "GCP Region the resources are launched in"
}

variable "bucket_name" {
  type        = string
  description = "GCP bucket storing function artifacts"
}

variable "revision" {
  type        = string
  description = "Github git sha - revision"
}

