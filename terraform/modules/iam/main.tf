# Create an IAM role that Lambda can assume
resource "aws_iam_role" "lambda_role" {
  name               = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = { Service = ["lambda.amazonaws.com"] }
    }]
  })
}

# Attach a policy allowing basic CloudWatch logging
resource "aws_iam_role_policy" "lambda_logging" {
  name   = "${var.role_name}-logs"
  role   = aws_iam_role.lambda_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
      Effect   = "Allow"
      Resource = "*"
    }]
  })
}
resource "aws_iam_user" "user_a" {
  name = "user-a"
}

resource "aws_iam_user" "user_b" {
  name = "user-b"
}

# User A: Read/Write access to Bucket A
resource "aws_iam_policy" "user_a_bucket_access" {
  name        = "user-a-bucket-a-policy"
  description = "Allow User A to Read/Write to Bucket A"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ],
      Resource = [
        "arn:aws:s3:::${var.bucket_a}",
        "arn:aws:s3:::${var.bucket_a}/*"
      ]
    }]
  })
}

# User B: Read-only access to Bucket B
resource "aws_iam_policy" "user_b_bucket_access" {
  name        = "user-b-bucket-b-policy"
  description = "Allow User B to Read-only from Bucket B"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      Resource = [
        "arn:aws:s3:::${var.bucket_b}",
        "arn:aws:s3:::${var.bucket_b}/*"
      ]
    }]
  })
}

# Attach policy to User A
resource "aws_iam_user_policy_attachment" "user_a_policy_attach" {
  user       = aws_iam_user.user_a.name
  policy_arn = aws_iam_policy.user_a_bucket_access.arn
}

# Attach policy to User B
resource "aws_iam_user_policy_attachment" "user_b_policy_attach" {
  user       = aws_iam_user.user_b.name
  policy_arn = aws_iam_policy.user_b_bucket_access.arn
}

