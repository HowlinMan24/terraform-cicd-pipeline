variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "bucket_prefix" {
  description = "Prefix used to build the globally-unique bucket name"
  type        = string
  default     = "terraform-cicd-prod"
}
