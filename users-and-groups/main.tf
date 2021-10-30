provider "aws" {
  region  = "us-east-1"
  profile = "rafael-admin"
}

resource "aws_iam_group" "terraform-group" {
  name = "terraform-group"
  path = "/user-group/programmatic-access/terraform/"
}

resource "aws_iam_user" "terraform-user" {
  name = "terraform-user"
  path = "/user/programmatic-access/terraform/"
}

resource "aws_iam_access_key" "accesskey" {
  user = aws_iam_user.terraform-user.name
}

resource "aws_iam_user_group_membership" "terraform-user-join-group" {
  user = aws_iam_user.terraform-user.name

  groups = [
    aws_iam_group.terraform-group.name
  ]
}
