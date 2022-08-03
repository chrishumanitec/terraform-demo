output "url" {
  value = aws_sqs_queue.queue.url
}

output "region" {
  value = var.region
}
