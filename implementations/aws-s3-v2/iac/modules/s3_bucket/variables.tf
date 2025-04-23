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
