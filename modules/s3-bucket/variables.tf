variable "bucket_prefix" {
  description = "Prefix used to build the globally-unique bucket name"
  type        = string
}

variable "tags" {
  description = "Common tags applied to the bucket"
  type        = map(string)
  default     = {}
}
