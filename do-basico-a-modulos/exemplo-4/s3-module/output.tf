output "aws_region" {
  value       = var.region
  description = "current aws region"
}

output "bucket_id" {
  value       = aws_s3_bucket.bucket.id
  description = "Bucket Name (aka ID)"
}

output "bucket_arn" {
  value       = aws_s3_bucket.bucket.arn
  description = "Bucket ARN"
}

output "bucket_fqdn" {
  value       = aws_s3_bucket.bucket.bucket_domain_name
  description = "Bucket ARN"
}
