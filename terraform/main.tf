resource "aws_s3_bucket" "resume_site" {

  bucket = "farhanazrayl-resume-2026"

  tags = {

    Name = "Cloud Resume Bucket"
    Project = "Cloud Resume"
    Managed = "Terraform"

  }

}