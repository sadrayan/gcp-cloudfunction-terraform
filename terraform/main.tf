module "my_http_function" {
  source       = "./modules/function_v2"
  archive_name = "MyHTTPFunction/myfunction-${var.revision}.zip"
  bucket_name  = var.bucket_name
  entry_point  = "helloHTTPFunction"
  name         = "myHelloFunction"
}
