resource "aws_s3_bucket" "resume_site" {

  bucket = var.bucket_name

  tags = {

    Name = "Cloud Resume Bucket"
    Project = "Cloud Resume"
    Managed = "Terraform"

  }

}