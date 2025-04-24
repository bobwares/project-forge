#!/bin/bash

# File: iac-files.sh
# Description: Shell script to scaffold secure S3 bucket Terraform files using best practices and the official module
# Author: bobwares
# Version: v1.0
# Created: April 2025

mkdir -p terraform-secure-s3
cd terraform-secure-s3 || exit

cat > main.tf <<EOF
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

  bucket = "\${var.environment}-\${var.domain}-\${var.bucket_name}"

  acl = null

  ownership_controls = {
    rules = [
      {
        object_ownership = "BucketOwnerEnforced"
      }
    ]
  }

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
EOF

cat > variables.tf <<EOF
# File: variables.tf
# Description: Variable definitions for S3 bucket deployment
# Author: bobwares
# Version: v1.0
# Created: April 2025

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "domain" {
  description = "Logical domain or grouping (e.g., media, logs)"
  type        = string
}

variable "bucket_name" {
  description = "Base name of the S3 bucket"
  type        = string
}

variable "region" {
  description = "AWS region for resource deployment"
  type        = string
}
EOF

cat > outputs.tf <<EOF
# File: outputs.tf
# Description: Outputs for deployed S3 bucket resources
# Author: bobwares
# Version: v1.0
# Created: April 2025

output "bucket_name" {
  description = "The name of the created S3 bucket"
  value       = module.secure_s3_bucket.bucket
}

output "bucket_arn" {
  description = "The ARN of the created S3 bucket"
  value       = module.secure_s3_bucket.bucket_arn
}
EOF

cat > vars.json <<EOF
{
  "environment": "dev",
  "domain": "media",
  "bucket_name": "assets",
  "region": "us-east-1"
}
EOF

echo "Terraform secure S3 bucket scaffold created in ./terraform-secure-s3"
