# File: main.tf
# Description: Main entrypoint for using the AWS S3 bucket module with secure and private settings
# Author: bobwares
# Version: v1.0
# Created: April 2025

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "secure_s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.0"

  bucket = "${var.environment}-${var.domain}-${var.bucket_name}"

  acl = null

  object_ownership = "BucketOwnerEnforced"

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true

  force_destroy = false

  tags = {
    Environment = var.environment
    Owner       = "bobwares"
  }
}
