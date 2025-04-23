# File: modules/s3_bucket/outputs.tf
# Description: Outputs from the S3 bucket module
# Author: bobwares
# Version: v1.0
# Created: April 2025

output "bucket_id" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.this.arn
}
