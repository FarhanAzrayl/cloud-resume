output "website_endpoint" {

  description = "S3 Website Endpoint"

  value = aws_s3_bucket_website_configuration.resume_site.website_endpoint

}

# API for the Lambda function (Visitor count)

output "api_endpoint" {
  value = aws_apigatewayv2_api.http_api.api_endpoint
}

