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
