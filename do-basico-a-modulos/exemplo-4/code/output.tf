output "aws_region_output" {
    description = "aws_region output from s3-module"
    value = module.s3.aws_region 
}

output "bucket_id_output" {
    description = "bucket_id output from s3-module"
    value = module.s3.bucket_id 
}

output "bucket_arn_output" {
    description = "bucket_arn output from s3-module"
    value = module.s3.bucket_arn
}

output "bucket_fqdn_output" {
    description = "bucket_fqdn output from s3-module"
    value = module.s3.bucket_fqdn
}
