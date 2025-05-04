output "lambda_exif_cleaner" {
  description = "Name of the Lambda EXIF cleaner function"
  value       = aws_lambda_function.exif_cleaner.function_name
}

output "lambda_exif_cleaner_arn" {
  description = "ARN of the Lambda EXIF cleaner function"
  value       = aws_lambda_function.exif_cleaner.arn
}
