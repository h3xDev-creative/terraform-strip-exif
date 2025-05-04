# General AWS and Environment Configuration
variable "aws_region" {
  description = "AWS region for resources"
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment environment (dev, prod, etc.)"
  default     = "dev"
}

# Vault Configuration
variable "vault_address" {
  description = "URL of the Vault server"
}

variable "vault_role_id" {
  description = "Vault AppRole RoleID (non-secret identifier)"
}

variable "vault_secret_id" {
  description = "Vault AppRole SecretID (sensitive, not stored here)"
  type        = string
  sensitive   = true
}

variable "vault_aws_backend" {
  description = "Mount path of Vault AWS secrets engine"
  default     = "aws"
}

variable "vault_aws_role" {
  description = "Role name in Vault AWS secrets engine"
  default     = "terraform-role"
}

# Lambda Function
variable "lambda_exif_cleaner" {
  description = "Name of the Lambda function for EXIF metadata cleaning"
  default     = "lambda-exif-cleaner"
}

# S3 Buckets
variable "s3_bucket_name" {
  description = "Name for the S3 bucket"
  default     = "my-bucket"
}

variable "bucket_a" {
  description = "The name of S3 Bucket A (accessed by User A)"
  type        = string
}

variable "bucket_b" {
  description = "The name of S3 Bucket B (accessed by User B)"
  type        = string
}
