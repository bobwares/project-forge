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
