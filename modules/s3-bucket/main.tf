resource "random_id" "suffix" {
  byte_length = 6
}

#checkov:skip=CKV_AWS_18:Demo bucket intentionally minimal; access logging is out of scope for this portfolio example
#checkov:skip=CKV2_AWS_61:Demo bucket intentionally minimal; lifecycle configuration is out of scope for this portfolio example
#checkov:skip=CKV2_AWS_62:Demo bucket intentionally minimal; event notifications are out of scope for this portfolio example
resource "aws_s3_bucket" "this" {
  bucket = "${var.bucket_prefix}-${random_id.suffix.hex}"

  tags = var.tags
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

#checkov:skip=CKV_AWS_145:AES256 is sufficient for this demo; customer-managed KMS key management is out of scope
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
