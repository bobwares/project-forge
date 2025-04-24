# Secure S3 Bucket Terraform Scaffold

## Overview

This project automates the setup of a secure, private AWS S3 bucket using Terraform and the official [terraform-aws-modules/s3-bucket](https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest) module. It adheres to AWS security best practices, including enforced ownership and complete blocking of public access.

## Features

- Enforces `BucketOwnerEnforced` ownership (no legacy `acl` usage)
- Applies strict public access blocking configurations
- Dynamically names the bucket using the pattern: `${environment}-${domain}-${bucket_name}`
- Uses trusted Terraform Registry module
- Externalizes configuration with `vars.json`
- Includes metadata headers in all Terraform files

## Directory Structure

```bash
terraform-secure-s3/
├── main.tf          # Module configuration and secure settings
├── outputs.tf       # Outputs for the created bucket
├── variables.tf     # Input variables
├── vars.json        # Externalized configuration values
├── README.md        # Project documentation
```

## Prerequisites

- Terraform >= 1.0
- AWS credentials configured (e.g., via `aws configure` or environment variables)
- Bash shell environment (macOS, Linux, or WSL)

## Configuration

Edit the `vars.json` file to provide the values for your environment:

```json
{
  "environment": "dev",
  "domain": "media",
  "bucket_name": "assets",
  "region": "us-east-1"
}
```

## CLI Instructions

From within the `terraform-secure-s3` directory:

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Apply the Configuration

```bash
terraform apply -var-file="vars.json"
```

Confirm when prompted to deploy the S3 bucket.

### 3. Destroy the Bucket (Optional)

```bash
terraform destroy -var-file="vars.json"
```

## Author

**bobwares**  
April 2025
```

Let me know if you'd like this saved as a file or zipped with the Terraform files.