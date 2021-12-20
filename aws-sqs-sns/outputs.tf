output "sns_arn" {
  value = aws_sns_topic.my_topic.arn
}

output "sqs_arn" {
  value = aws_sqs_queue.my_queue.arn
}

output "sqs_policy" {
  value = aws_sqs_queue_policy.sqs_policy.policy
}
