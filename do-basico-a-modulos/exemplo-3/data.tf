/**
 * É preciso criar um bucket primeiro, vamos buscar informações do bucket na aws.
 * Podemos criar o bucket na pasta exemplo-2 e então buscar as informações dele na pasta exemplo-3.
 *
 * 1 - Terraform plan, Terraform apply na pasta exemplo-2
 * 2 - Terraform plan na pasta exemplo-3
 * 3 - Terraform destroy na pasta exemplo-2
*/

data "aws_s3_bucket" "bucket_info" {
  bucket = var.bucket_name
}
