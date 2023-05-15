# Public Cloud Configuration
provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test123"
  secret_key                  = "testabc"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_force_path_style         = true
  endpoints {
    s3 = "http://localhost:4566"
  }
}

resource "aws_lambda_function" "example_lambda" {
  function_name = "example_lambda"
  runtime = "nodejs14.x"
  handler = "index.handler"
  timeout = 10
  memory_size = 128

  role = aws_iam_role.lambda_role.arn

  // You can provide your own Lambda function code here
  filename = "test-lambda.zip"
  source_code_hash = filebase64sha256("test-lambda.zip")
}

resource "aws_iam_role" "lambda_role" {
  name = "example_lambda_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_role_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}