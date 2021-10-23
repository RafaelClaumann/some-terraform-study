# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "bucket-rafael-claumann-xyz"
  acl    = "private"

  tags = {
    "Name" = "simple bucket example"
  }
}

output "bucket_id_output" {
  value       = aws_s3_bucket.bucket.id
  description = "Bucket Name (aka ID)"
}

output "bucket_arn_output" {
  value       = aws_s3_bucket.bucket.arn
  description = "Bucket ARN"
}
