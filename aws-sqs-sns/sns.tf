locals {
  topic_name = "liberacao-debito"
  queue_name = "liberacao-debito"
}

data "aws_caller_identity" "current_user" {}

resource "aws_sns_topic" "my_sns" {
  name = local.topic_name
}

resource "aws_sqs_queue" "my_queue" {
  name = local.queue_name

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.my_queue_dlq.arn,
    maxReceiveCount     = 3
  })
}

resource "aws_sqs_queue" "my_queue_dlq" {
  name = "${local.queue_name}-dlq"
}

resource "aws_sns_topic_subscription" "sqs_sns_subscription" {
  protocol  = "sqs"
  topic_arn = aws_sns_topic.my_sns.arn
  endpoint  = aws_sqs_queue.my_queue.arn
}

resource "aws_sqs_queue_policy" "sqs-send-message-policy" {
  queue_url = aws_sqs_queue.my_queue.url

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Sid": "topic-subscription",
      "Effect": "Allow",
      "Principal": {
        "Service": "sns.amazonaws.com"
      },
      "Action": "SQS:SendMessage",
      "Resource": "${aws_sqs_queue.my_queue.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.my_sns.arn}"
        }
      }
    }
  ]
}
POLICY
}

output "account_id" {
  value = data.aws_caller_identity.current_user.account_id
}

output "account_arn" {
  value = data.aws_caller_identity.current_user.arn
}

output "sns-service-arn" {
  value = aws_sns_topic.my_sns.arn
}

output "sqs-service-arn" {
  value = aws_sqs_queue.my_queue.arn
}

output "sqs-service-policy" {
  value = aws_sqs_queue.my_queue.policy
}
