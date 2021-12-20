data "aws_caller_identity" "current" {}

resource "aws_sns_topic" "my_topic" {
  name = var.topic_name
}

resource "aws_sns_topic_policy" "default" {
  arn = aws_sns_topic.my_topic.arn

  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    actions = [
      "SNS:Publish"
    ]

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["${data.aws_caller_identity.current.arn}"]
    }

    resources = [aws_sns_topic.my_topic.arn]

    sid = "enable-sns-access"
  }
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

resource "aws_sqs_queue_policy" "sqs_dlq_policy" {
  queue_url = aws_sqs_queue.my_queue_dlq.url

  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "enable-sqs-access-dlq",
        "Effect": "Allow",
        "Principal": {
          "AWS": "${data.aws_caller_identity.current.arn}"
        },
        "Action": "SQS:SendMessage",
        "Resource": "${aws_sqs_queue.my_queue_dlq.arn}",
        "Condition": {
          "ArnEquals": {
            "aws:SourceArn": "${aws_sqs_queue.my_queue.arn}"
          }
        }
      }
    ]
  }
  POLICY
}

resource "aws_sqs_queue_policy" "sqs_policy" {
  queue_url = aws_sqs_queue.my_queue.url

  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "enable-sqs-access",
        "Effect": "Allow",
        "Principal": {
          "Service": "sqs.amazonaws.com"
        },
        "Action": ["SQS:SendMessage", "SQS:ReceiveMessage"],
        "Resource": "${aws_sqs_queue.my_queue.arn}"
      },
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
