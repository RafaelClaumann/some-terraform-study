output "policy-description" {
  value       = aws_iam_group_policy.terraform-policy.policy
  description = "json description of policy"
}

output "policy-group" {
  value       = aws_iam_group_policy.terraform-policy.group
  description = "group that policy are attached"
}
