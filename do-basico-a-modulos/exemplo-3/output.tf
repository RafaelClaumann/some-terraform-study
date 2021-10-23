output "aws_region" {
  value       = var.region
  description = "current aws region"
}

output "bucket_id_output" {
  value       = data.aws_s3_bucket.bucket_info.id
  description = "Bucket Name (aka ID)"
}

output "bucket_arn_output" {
  value       = data.aws_s3_bucket.bucket_info.arn
  description = "Bucket ARN"
}

output "bucket_fqn_output" {
  value       = data.aws_s3_bucket.bucket_info.bucket_domain_name
  description = "Bucket ARN"
}

output "bucket_raw_info" {
  value       = data.aws_s3_bucket.bucket_info
  description = "fetch all information about bucket"
}
