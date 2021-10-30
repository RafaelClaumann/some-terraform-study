# https://learn.hashicorp.com/tutorials/terraform/aws-iam-policy?in=terraform/aws
provider "aws" {
  region  = "us-east-1"
  profile = "rafael-admin"
}

resource "aws_iam_group" "terraform-group" {
  name = "terraform-group"
  path = "/user-group/programmatic-access/terraform/"
}

data "aws_iam_policy" "s3-full-access" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_group_policy_attachment" "attachment" {
  group      = aws_iam_group.terraform-group.name
  policy_arn = data.aws_iam_policy.s3-full-access.arn
}

output "rendered_policy" {
  value = data.aws_iam_policy.s3-full-access.policy
}
