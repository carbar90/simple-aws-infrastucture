provider "aws" {
  access_key                  = "test"     # Placeholder or dummy access key
  secret_key                  = "test"     # Placeholder or dummy secret key
  region                      = "us-east-1"  # Use the desired region
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    iam    = "http://localhost:4566"
    sts    = "http://localhost:4566"
    lambda = "http://localhost:4566"  # LocalStack Lambda endpoint
    # Add other service endpoints as needed
  }
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "index.js"
  output_path = "lambda.zip"
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "index.js"
  output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "my_lambda_function" {
  function_name = "myLocalLambdaFunction"
  handler       = "index.handler"          # Lambda function handler (e.g., file.function)
  runtime       = "nodejs14.x"            # Lambda runtime
  timeout       = 10
  role          = aws_iam_role.lambda_execution_role.arn
  filename      = "lambda_function.zip"   # Path to your Lambda function code zip file
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
}


    #apigateway     = "http://localhost:4567"
    #cloudformation = "http://localhost:4581"
    #cloudwatch     = "http://localhost:4582"
    #dynamodb       = "http://localhost:4569"
    #route53        = "http://localhost:4580"
    #s3             = "http://localhost:4572"
    #ses            = "http://localhost:4579"
    #sns            = "http://localhost:4575"
    #sqs            = "http://localhost:4576"
    #ssm            = "http://localhost:4583"
    #sts            = "http://localhost:4592"