provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

resource "aws_s3_bucket" "example" {
  bucket = "my-unique-s3-bucket-name-123456hjkhkjhkjhkjh"  # Change to a globally unique name
  acl    = "private"

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Dev"
  }
}
