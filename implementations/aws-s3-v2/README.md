# Secure S3 Bucket Terraform Scaffold

## Process

This project automates the creation of a secure, private S3 bucket module in Terraform by using a simple shell script. Here’s how it works:

1. **Directory and File Scaffolding**

   Running the `iac-files.sh` script will create the following structure:

   ```text
   .
   ├── main.tf
   ├── variables.tf
   ├── outputs.tf
   ├── iac-files.sh
   └── modules
       └── s3_bucket
           ├── main.tf
           ├── variables.tf
           └── outputs.tf
   ```

2. **Metadata Headers**  
   Each `.tf` file begins with a metadata header including:
    - File name
    - Description
    - Author
    - Version
    - Creation date

3. **Best Practices Enforced**
    - **No deprecated ACLs**: Uses `aws_s3_bucket_ownership_controls` with `BucketOwnerEnforced`.
    - **Ownership enforcement**: Disables ACL-based access control.
    - **Public access blocked**: Applies `aws_s3_bucket_public_access_block` with all blocks set to `true`.
    - **Dynamic naming**: Bucket name is formatted as `${environment}-${domain}-${bucket_name}`.
    - **Modular design**: All S3 logic resides in `modules/s3_bucket` for reuse.

4. **Externalized Inputs**  
   All variables are read from a `vars.json` file passed via `-var-file`:
    - `environment`
    - `domain`
    - `bucket_name`
    - `region`

## CLI Instructions

1. **Clone or copy this repository**
   ```bash
   git clone <repository-url> secure-s3-terraform
   cd secure-s3-terraform
   ```

2. **Create your `vars.json`**
   ```json
   {
     "environment": "dev",
     "domain":      "example",
     "bucket_name": "mybucket",
     "region":      "us-east-1"
   }
   ```

3. **Generate Terraform files**
   ```bash
   bash iac-files.sh
   ```

4. **Initialize Terraform**
   ```bash
   terraform init
   ```

5. **Apply the configuration**
   ```bash
   terraform apply -var-file="vars.json"
   ```

6. **Verify Outputs**  
   After apply completes, note the `bucket_id` and `bucket_arn` outputs for integration with other infrastructure.