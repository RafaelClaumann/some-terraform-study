# Attach policies managed by aws

data "aws_iam_policy" "s3-full-access" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_group_policy_attachment" "attachment-aws-managed" {
  group      = aws_iam_group.terraform-group.name
  policy_arn = data.aws_iam_policy.s3-full-access.arn
}
