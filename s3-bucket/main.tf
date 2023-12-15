# Public Cloud Configuration
provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_use_path_style         = true
  endpoints {
    s3 = "http://localhost:4566"
  }
}

# Create Bucket
resource "aws_s3_bucket" "base_bucket" {
  bucket = "test-bucket-terraform"
  acl    = "public-read"
}