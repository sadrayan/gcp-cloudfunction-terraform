module "google_cloudfunctions_function"  {
  name                  = "${var.name}-function"
  region                = var.region
  description           = "${var.name} function"
  runtime               = "nodejs18"
  available_memory_mb   = 512
  source_archive_bucket = var.bucket_name
  source_archive_object = var.archive_name
  timeout               = 60
  trigger_http          = true
  entry_point           = var.entry_point
  source                = ""
}
