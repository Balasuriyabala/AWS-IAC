resource "aws_s3_bucket" "my_bucketday25" {
  bucket = var.aws_s3_bucket

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}