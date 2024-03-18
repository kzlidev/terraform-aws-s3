mock_provider "aws" {}

variables {
  bucket_name = "test"
}

run "valid_bucket_name" {
  command = plan

  variables {
    bucket_name = "likz"
  }

  assert {
    condition     = endswith(aws_s3_bucket.bucket.bucket, "-bucket")
    error_message = "S3 bucket name should end with `-bucket`"
  }
}

run "invalid_valid_region" {
  command = plan

  variables {
    bucket_name = "likz"
    region      = "us-east-1"
  }

  expect_failures = [var.region]
}
