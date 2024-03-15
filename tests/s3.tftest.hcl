mock_provider "aws" {}

run "valid_bucket_name" {
  command = plan # If this is an apply, resource will actually be created

  variables {
    bucket_name = "likz"
  }

  assert {
    condition     = endswith(aws_s3_bucket.bucket.bucket, "-bucket")
    error_message = "S3 bucket name should end with `-bucket`"
  }
}

run "invalid_valid_region" {
  command = plan # If this is an apply, resource will actually be created

  variables {
    bucket_name = "likz"
    region = "us-east-1"
  }

  expect_failures = [var.region]
}

#run "aes_encryption" {
#  command = plan
#
#  assert {
#    condition     = aws_s3_bucket_server_side_encryption_configuration.encrypt_config.rule[0].apply_server_side_encryption_by_default.sse_algorithm == "AES256"
#    error_message = "Encryption algorithm must be AES256"
#  }
#}

#run "valid_string_concat" {
#  command = plan
#
#  assert {
#    condition     = aws_s3_bucket.bucket.bucket == "test-bucket"
#    error_message = "S3 bucket name did not match expected"
#  }
#}