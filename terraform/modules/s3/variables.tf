variable "bucket_name" {
  description = "Name of the S3 bucket to create"
  type        = string
}
variable "environment" {
  description = "Deployment environment (for tagging)"
  type        = string
}
