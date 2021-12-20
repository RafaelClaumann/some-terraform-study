variable "topic_name" {
  description = "nome do topico SNS"
  type        = string
  default     = "my_sns_topic"
}

variable "queue_name" {
  description = "nome da fila SQS"
  type        = string
  default     = "my_sqs_queue"
}
