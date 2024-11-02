# Importing official AWS modules for S3, Lambda, DynamoDB, SNS, and API Gateway

module "s3_lambda" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.0"
  bucket  = "passport-office-${var.environment}-${random_string.suffix.result}"
}

module "lambda_function" {
  source        = "terraform-aws-modules/lambda/aws"
  version       = "~> 2.0"
  function_name = "processPassport"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  source_path   = "path/to/lambda_function_code" # Specify path to Lambda code
  publish       = true

  environment_variables = {
    "DYNAMODB_TABLE" = module.dynamodb.table_name
  }
}

module "dynamodb" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "~> 1.0"
  #   table_name = "passportData-${var.environment}"
  hash_key = "passport_id"
  attributes = [{
    name = "passport_id"
    type = "S"
  }]
  billing_mode = "PAY_PER_REQUEST"
}

module "sns" {
  source  = "terraform-aws-modules/sns/aws"
  version = "~> 3.0"
  name    = "passport_notifications_${var.environment}"
}

module "api_gateway" {
  source  = "terraform-aws-modules/api-gateway-v2/aws"
  version = "~> 1.0"
  name    = "passportApiGateway_${var.environment}"
}
