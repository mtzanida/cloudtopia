terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  access_key = "test"
  secret_key = "test"
  region     = "us-west-2"
  endpoints {
    s3         = "http://localhost:4566"
    lambda     = "http://localhost:4566"
    dynamodb   = "http://localhost:4566"
    sns        = "http://localhost:4566"
    apigateway = "http://localhost:4566"
  }
}

