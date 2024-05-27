variables {
  bucket_name = "likz-demo"
}

run "valid_bucket_name" {
  command = apply

  variables {
    bucket_name = "likz-demo-1"
  }

  assert {
    condition     = aws_s3_bucket.bucket.bucket == "likz-demo-1-bucket"
    error_message = "S3 bucket name should be `likz-demo-1-bucket`"
  }
}

run "invalid_valid_region" {
  command = plan

  variables {
    bucket_name = "likz-demo-2"
    region      = "us-east-1"
  }

  expect_failures = [var.region]
}
