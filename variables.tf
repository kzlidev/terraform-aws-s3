variable "bucket_name" {
  type        = string
  description = "Name of S3 bucket"
}

variable "tags" {
  description = "Tags to apply on the S3 bucket"
  type        = map(string)
  default     = {}
}

variable "new_variable" {
  description = "New variable"
  type        = string
  default     = ""
}