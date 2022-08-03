resource "aws_sqs_queue" "queue" {
  name_prefix               = var.queue_name
  max_message_size          = 2048
  message_retention_seconds = 60
  receive_wait_time_seconds = 10
}