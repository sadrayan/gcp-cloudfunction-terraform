resource "google_cloudfunctions2_function" "function" {
  name        = "${var.name}-function"
  location    = var.region
  description = "${var.name} function"

  build_config {
    runtime     = "nodejs18"
    entry_point = var.entry_point # Set the entry point
    source {
      storage_source {
        bucket = var.bucket_name
        object = var.archive_name
      }
    }
  }

  service_config {
    max_instance_count = 1
    available_memory   = "1024M"
    timeout_seconds    = 60
  }
}
