
module "my_http_function" {
  source       = "modules/function_v2"
  archive_name = "MyHTTPFunction/myfunction-${var.revision}.zip"
  bucket_name  = var.bucket_name
  entry_point  = "helloHTTPFunction"
  name         = "myHelloFunction"
}

#resource "google_service_account" "function_invoker_account" {
#  account_id = "sample-function-invoker"
#  display_name = "sample function invoker"
#}

#resource "google_cloudfunctions_function_iam_member" "invoker" {
#  project = google_cloudfunctions_function.http_function.project
#  region = google_cloudfunctions_function.http_function.region
#  cloud_function = google_cloudfunctions_function.http_function.name
#
#  role= "roles/cloudfunctions.invoker"
#  member="serviceAccount:${google_service_account.function_invoker_account.email}"
#}