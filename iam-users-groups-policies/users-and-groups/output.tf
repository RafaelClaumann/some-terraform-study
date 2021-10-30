output "group-id" {
  value       = aws_iam_group.terraform-group.id
  description = "terraform-group id"
}

output "group-arn" {
  value       = aws_iam_group.terraform-group.arn
  description = "terraform-group arn"
}

output "user-arn" {
  value       = aws_iam_user.terraform-user.arn
  description = "terraform-user arn"
}
