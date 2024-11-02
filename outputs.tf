output "s3_bucket_name" {
  description = "The name of the S3 bucket for passport processing"
  value       = module.s3_lambda.bucket_id
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = module.lambda_function.this_lambda_function_arn
}

output "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  value       = module.dynamodb.table_name
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic"
  value       = module.sns.sns_topic_arn
}

output "api_gateway_url" {
  description = "URL of the API Gateway"
  value       = module.api_gateway.api_endpoint
}
