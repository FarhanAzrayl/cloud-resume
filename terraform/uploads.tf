resource "aws_s3_object" "website_files" {
  for_each = local.website_files

  bucket = aws_s3_bucket.resume_site.id

  key    = each.value
  source = "../website/${each.value}"

  etag = filemd5("../website/${each.value}")

  content_type = lookup(
    {
      html = "text/html"
      css  = "text/css"
      js   = "application/javascript"
      jpg  = "image/jpeg"
      jpeg = "image/jpeg"
      png  = "image/png"
      pdf  = "application/pdf"
      svg  = "image/svg+xml"
      ico  = "image/x-icon"
    },
    reverse(split(".", each.value))[0],
    "application/octet-stream"
  )
}