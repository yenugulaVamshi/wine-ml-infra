module "artifact_bucket" {
  source = "../../modules/s3"

  bucket_name = var.artifact_bucket_name
}
