variable "region" {
  type        = string
  default     = "us-central1"
  description = "GCP Region"
}

variable "name" {
  type        = string
  description = "GCP function name"
}

variable "entry_point" {
  type        = string
  description = "GCP function entry point"
}

variable "bucket_name" {
  type        = string
  description = "GCP function artifact bucket name"
}

variable "archive_name" {
  type        = string
  description = "GCP function artifact archive name"
}