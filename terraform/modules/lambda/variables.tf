variable "lambda_exif_cleaner" {
  description = "Name of the Lambda function for EXIF cleaning"
  type        = string
}

variable "role_arn" {
  description = "ARN of the IAM role for Lambda"
  type        = string
}

variable "environment" {
  description = "Deployment environment (used to locate Vault secrets)"
  type        = string
}
