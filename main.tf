terraform {
  backend "s3" {
    bucket         = "terraform-buck-1"
    key            = "project-folder/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    #dynamodb_table = "your-lock-table"  # optional but recommended for locking
  }
}
#resource "random_id" "suffix" {
#  byte_length = 4
#}

resource "random_pet" "bucket_suffix" {
  length = 2
}

module "S3" {
  source           = "./modules/s3"
  aws_s3_bucket    = "my-s3-bucket-${random_pet.bucket_suffix.id}"
 # aws_s3_bucket    = "yamahamt15-${random_id.suffix.hex}" 

}
# VPC module
module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  availability_zones = data.aws_availability_zones.available.names 
  webapp_public_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
  webapp_private_subnet_cidr_blocks = ["10.0.101.0/24", "10.0.102.0/24"]
  
}
