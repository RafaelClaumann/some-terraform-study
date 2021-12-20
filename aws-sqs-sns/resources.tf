resource "aws_sns_topic" "my_topic" {
  name = var.topic_name
}

resource "aws_sqs_queue" "my_queue" {
  name = var.queue_name

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.my_queue_dlq.arn,
    maxReceiveCount     = 3
  })
}

resource "aws_sqs_queue" "my_queue_dlq" {
  name = "${var.queue_name}-dlq"
}

resource "aws_sqs_queue_policy" "sqs_policy" {
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
            "aws:SourceArn": "${aws_sns_topic.my_topic.arn}"
          }
        }
      }
    ]
  }
  POLICY
}

resource "aws_sns_topic_subscription" "sqs_sns_subscription" {
  protocol  = "sqs"
  topic_arn = aws_sns_topic.my_topic.arn
  endpoint  = aws_sqs_queue.my_queue.arn
}
