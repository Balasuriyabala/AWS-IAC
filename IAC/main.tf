provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source           = "./modules/vpc"
  project_name     = var.project_name
  vpc_cidr_block   = var.vpc_cidr_block
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
}
