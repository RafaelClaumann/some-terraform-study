# Attach policies managed by user

resource "aws_iam_policy" "s3-json-policy" {
  name        = "s3-json-policy"
  path        = "/"
  description = "My JSON-S3 policy"

  policy = file("json/s3-bucket.json")
}

resource "aws_iam_policy" "s3-jsonencode-policy" {
  name        = "s3-jsonencode-policy"
  path        = "/"
  description = "My jsonencode-S3 policy"

  policy = jsonencode({
    "Version" = "2012-10-17"
    "Statement" : [
      {
        "Action" : [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iam_group_policy_attachment" "attachment-s3-json" {
  group      = aws_iam_group.terraform-group.name
  policy_arn = aws_iam_policy.s3-json-policy.arn
}

resource "aws_iam_group_policy_attachment" "attachment-s3-jsonencode" {
  group      = aws_iam_group.terraform-group.name
  policy_arn = aws_iam_policy.s3-jsonencode-policy.arn
}
