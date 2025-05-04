# Create the AWS Lambda function for EXIF metadata cleaning
resource "aws_lambda_function" "exif_cleaner" {
  function_name = var.lambda_exif_cleaner
  role          = var.role_arn
  handler       = "exif_cleaner.lambda_handler"  
  runtime       = "python3.9"

  filename         = "lambda_payload.zip"
  source_code_hash = filebase64sha256("lambda_payload.zip")

  # Pass the destination bucket into Lambda via an env var
  environment {
    variables = {
      DEST_BUCKET = var.bucket_b
    }
  }

  timeout     = 30
  memory_size = 128
}
