# terraform.tfvars (committed values, NO SECRET DATA)

environment         = "dev"
aws_region          = "us-east-1"
vault_address       = "https://h3xdevcreative.vault.hashicorp.cloud"
vault_role_id       = "my-approle-role-id"
vault_aws_role      = "terraform-role"

lambda_exif_cleaner = "app1-handler"
s3_bucket_name      = "app1-data-bucket"
bucket_a            = "bucket-a-name"
bucket_b            = "bucket-b-name"
