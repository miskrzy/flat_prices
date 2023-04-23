resource "aws_s3_bucket" "main-storage" {
  bucket = "${local.resource_prefix}-main-storage"
}