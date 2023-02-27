resource "aws_sqs_queue" "{{sqs_name_with_underscores}}_queue" {
  name = "{{sqs_name_with_hyphens}}_queue"
  delay_seconds = 90
  max_message_size = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.{{sqs_name_with_underscores}}_dlq.arn
    maxReceiveCount = 4
  })
}

resource "aws_sqs_queue" "{{sqs_name_with_underscores}}_dlq" {
  name = "{{sqs_name_with_hyphens}}_dlq"  
}
