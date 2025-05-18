provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "static_site" {
  bucket = "static-website-using-terraform-deepak"
}

resource "aws_s3_bucket_website_configuration" "static_site_config" {
  bucket = aws_s3_bucket.static_site.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Configure the public access block settings separately
resource "aws_s3_bucket_public_access_block" "static_site" {
  bucket = aws_s3_bucket.static_site.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Upload index.html with public-read ACL
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.static_site.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
  etag         = filemd5("index.html")
 
}

# Upload error.html with public-read ACL
resource "aws_s3_object" "error_html" {
  bucket       = aws_s3_bucket.static_site.id
  key          = "error.html"
  source       = "error.html"
  content_type = "text/html"
  etag         = filemd5("error.html")
  
}

# Bucket policy to allow public read access
resource "aws_s3_bucket_policy" "public_access" {
  bucket = aws_s3_bucket.static_site.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = ["s3:GetObject"],
        Resource  = ["${aws_s3_bucket.static_site.arn}/*"]
      }
    ]
  })
}
