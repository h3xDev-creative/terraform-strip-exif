# Call the IAM module to create an IAM role and IAM users for Lambda and S3
module "iam" {
  source     = "./modules/iam"
  role_name  = "lambda_exec_role"
  bucket_a   = var.bucket_a
  bucket_b   = var.bucket_b
}

# Call the Lambda module, supplying the IAM role ARN and environment name
module "lambda" {
  source              = "./modules/lambda"
  lambda_exif_cleaner = var.lambda_exif_cleaner
  role_arn            = module.iam.lambda_role_arn
  environment         = var.environment
}

# Call the S3 module to create a bucket
module "s3" {
  source      = "./modules/s3"
  bucket_name = var.s3_bucket_name
  environment = var.environment
}
