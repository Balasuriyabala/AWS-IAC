output "s3_bucket_name" {
  value = module.S3.bucket_name
}

output "vpc_id" {
  value = module.vpc.vpc_id 
}