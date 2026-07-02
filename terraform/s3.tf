resource "aws_s3_bucket" "resume_site" {

  bucket = var.bucket_name

  tags = {

    Name    = "Cloud Resume Bucket"
    Project = "Cloud Resume"
    Managed = "Terraform"

  }

}

# Enable Web Hosting

resource "aws_s3_bucket_website_configuration" "resume_site" {

  bucket = aws_s3_bucket.resume_site.id

  index_document {

    suffix = "index.html"

  }

  # Put the error page if needed for upgrade (later if rajin!!)

  error_document {

    key = "index.html"

  }

}

# Adding the Bucket policy through here instead of on the console


resource "aws_s3_bucket_policy" "resume_site" {
  bucket = aws_s3_bucket.resume_site.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "PublicReadGetObject"
        Effect = "Allow"

        Principal = "*"

        Action = [
          "s3:GetObject"
        ]

        Resource = [
          "${aws_s3_bucket.resume_site.arn}/*"

          # Reember that the star /* is basically to point/define all files in the folder folder directory folder
        ]
      }
    ]
  })
}



# Adding Versions for backup / rollback purposes

resource "aws_s3_bucket_versioning" "resume_site" {

  bucket = aws_s3_bucket.resume_site.id

  versioning_configuration {

    status = "Enabled"

  }

}

# Enable encryption - Best practice eventhough this is only a resume project

resource "aws_s3_bucket_server_side_encryption_configuration" "resume_site" {

  bucket = aws_s3_bucket.resume_site.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"

    }

  }

}

# Enable Ownership controls so new AWS accounts - set who is the owner of the bucket

resource "aws_s3_bucket_ownership_controls" "resume_site" {

  bucket = aws_s3_bucket.resume_site.id

  rule {

    object_ownership = "BucketOwnerPreferred"

  }

}

# To enable public access - actually not needed for S3, but we add anyways. The logic is we want the users to be able to read files okay?
# And also this is only to disable blocks (if tehre are any), bucket is still not public

resource "aws_s3_bucket_public_access_block" "resume_site" {

  bucket = aws_s3_bucket.resume_site.id

  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false

}