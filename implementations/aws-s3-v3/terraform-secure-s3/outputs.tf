# File: outputs.tf
# Description: Outputs for deployed S3 bucket resources
# Author: bobwares
# Version: v1.0
# Created: April 2025

output "bucket_name" {
  description = "The name of the created S3 bucket"
  value       = module.secure_s3_bucket.s3_bucket_id
}

output "bucket_arn" {
  description = "The ARN of the created S3 bucket"
  value       = module.secure_s3_bucket.s3_bucket_arn
}
