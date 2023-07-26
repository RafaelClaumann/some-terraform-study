output "lambda_basic_policy" {
  value = data.aws_iam_policy.lambda_basic_policy.policy
}

output "lambda_basic_policy_arn" {
  value = aws_iam_role_policy_attachment.lambda_role_policy_attach.policy_arn
}
