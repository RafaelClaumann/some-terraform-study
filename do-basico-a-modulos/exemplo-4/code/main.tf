locals {
  env         = "dev"
  bucket_name = "rafaelclaumann"
}

module "s3" {
  source = "../s3-module/"

  environment = local.env
  bucket_name = local.bucket_name
}
