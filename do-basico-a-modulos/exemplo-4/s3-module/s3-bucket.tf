resource "aws_s3_bucket" "bucket" {
  bucket = join("-", [var.bucket_name, var.environment, "terraform"])
  acl    = "private"

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}
