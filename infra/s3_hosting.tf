resource "aws_s3_bucket" "todo-app" {
  bucket        = var.bucket_name
  force_destroy = true

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "todo-app-bucket-policy" {
  bucket = aws_s3_bucket.todo-app.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "todo-app-web-config" {
  bucket = aws_s3_bucket.todo-app.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    sid    = "1"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.todo-app.arn}/*",
    ]
  }
}