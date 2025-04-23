# File: outputs.tf
# Description: Exposes outputs from the S3 bucket module
# Author: bobwares
# Version: v1.0
# Created: April 2025

output "bucket_id" {
  description = "The name of the S3 bucket"
  value       = module.s3_bucket.bucket_id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = module.s3_bucket.bucket_arn
}
