output "lambda_exif_cleaner" {
  description = "Name of the deployed EXIF cleaner Lambda function"
  value       = module.lambda.lambda_exif_cleaner
}

output "bucket_a_name" {
  description = "Name of Bucket A (upload bucket)"
  value       = module.s3.bucket_a_name
}

output "bucket_b_name" {
  description = "Name of Bucket B (processed files bucket)"
  value       = module.s3.bucket_b_name
}


output "lambda_role_arn" {
  description = "ARN of the IAM role assigned to the Lambda function"
  value       = module.iam.lambda_role_arn
}
