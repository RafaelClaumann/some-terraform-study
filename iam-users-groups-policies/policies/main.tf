provider "aws" {
  region  = "us-east-1"
  profile = "rafael-admin"
}

resource "aws_iam_group" "terraform-group" {
  name = "terraform-group"
  path = "/user-group/programmatic-access/terraform/"
}

resource "aws_iam_group_policy" "terraform-policy" {
  name  = "terraform-policy"
  group = aws_iam_group.terraform-group.name

  policy = file("json/s3-bucket.json")
}
