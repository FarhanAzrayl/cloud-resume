output "website_endpoint" {

  description = "S3 Website Endpoint"

  value = aws_s3_bucket_website_configuration.resume_site.website_endpoint

}