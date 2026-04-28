provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "pipeline_bucket" {
  bucket = "tems-github-actions-bucket-2026"

  tags = {
    Name        = "Pipeline Bucket"
    Environment = "dev"
    ManagedBy   = "terraform"
    CreatedBy   = "github-actions"
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.pipeline_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
