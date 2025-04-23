# File: modules/s3_bucket/main.tf
# Description: Defines the S3 bucket with ownership and public access controls
# Author: bobwares
# Version: v1.0
# Created: April 2025

resource "aws_s3_bucket" "this" {
  bucket = "${var.environment}-${var.domain}-${var.bucket_name}"
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}
