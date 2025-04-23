#!/bin/bash
#
# Combined IaC Generation Script
# @application S3 Bucket Terraform Scaffold
# @source ./iac-files.sh
# @author bobwares
# @version 1.0
# @description Generates Terraform files for a secure, private S3 bucket module following best practices
# @updated April 2025

set -euo pipefail

# Create directory structure
mkdir -p modules/s3_bucket

# Root main.tf
cat > main.tf << 'EOF'
# File: main.tf
# Description: Root configuration that invokes the S3 bucket module
# Author: bobwares
# Version: v1.0
# Created: April 2025

terraform {
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

module "s3_bucket" {
  source      = "./modules/s3_bucket"
  environment = var.environment
  domain      = var.domain
  bucket_name = var.bucket_name
}
EOF

# Root variables.tf
cat > variables.tf << 'EOF'
# File: variables.tf
# Description: Declares root-level variables for the module
# Author: bobwares
# Version: v1.0
# Created: April 2025

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

variable "domain" {
  description = "Domain or project identifier"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "region" {
  description = "AWS region to deploy into"
  type        = string
}
EOF

# Root outputs.tf
cat > outputs.tf << 'EOF'
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
EOF

# Module main.tf
cat > modules/s3_bucket/main.tf << 'EOF'
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
EOF

# Module variables.tf
cat > modules/s3_bucket/variables.tf << 'EOF'
# File: modules/s3_bucket/variables.tf
# Description: Variables for the S3 bucket module
# Author: bobwares
# Version: v1.0
# Created: April 2025

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

variable "domain" {
  description = "Domain or project identifier"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}
EOF

# Module outputs.tf
cat > modules/s3_bucket/outputs.tf << 'EOF'
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
EOF

echo "Terraform S3 bucket scaffold generated successfully."
