# https://learn.hashicorp.com/tutorials/terraform/aws-iam-policy?in=terraform/aws
provider "aws" {
  region  = "us-east-1"
  profile = "rafael-admin"
}

resource "aws_iam_group" "terraform-group" {
  name = "terraform-group"
  path = "/user-group/programmatic-access/terraform/"
}
