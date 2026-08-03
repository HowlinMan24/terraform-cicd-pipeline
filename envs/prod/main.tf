locals {
  tags = {
    Project     = "terraform-cicd-pipeline"
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

module "s3_bucket" {
  source = "../../modules/s3-bucket"

  bucket_prefix = var.bucket_prefix
  tags          = local.tags
}
