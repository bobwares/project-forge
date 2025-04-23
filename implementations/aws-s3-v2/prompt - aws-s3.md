Create Terraform files for deploying a secure and private S3 bucket to AWS using **current best practices**, defined as follows:

1. **Avoid Deprecated ACLs**
    - Do not use the `acl` field.
    - Use `aws_s3_bucket_ownership_controls` with `object_ownership = "BucketOwnerEnforced"`.

2. **Enforce Bucket Ownership**
    - Ensure the bucket uses `BucketOwnerEnforced` ownership to disable ACL-based access control.

3. **Block All Public Access**
    - Use `aws_s3_bucket_public_access_block` with:
        - `block_public_acls = true`
        - `ignore_public_acls = true`
        - `block_public_policy = true`
        - `restrict_public_buckets = true`

4. **Use Dynamic and Consistent Naming**
    - The bucket name should follow this format:  
      `${environment}-${domain}-${bucket_name}`

5. **Modularize Terraform Code**
    - Place the S3 bucket logic in a reusable Terraform module to promote code reuse and separation of concerns.

6. **Externalize Configuration Inputs**
    - All input values (`environment`, `domain`, `bucket_name`, and `region`) must be provided via a `vars.json` file.
    - Apply the configuration using the `-var-file` flag:  
      `terraform apply -var-file="vars.json"`

7. **Metadata Header in All Terraform Files**
    - Each `.tf` file must start with the following header:

```markdown
# File: (e.g., main.tf)
# Description: (brief purpose of the file)
# Author: (placeholder or “bobwares”)
# Version: (e.g., v1.0)
# Created: (use a placeholder like April 2025)
```