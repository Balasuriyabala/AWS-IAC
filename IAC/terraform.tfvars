project_name     = "prod-app"
vpc_cidr_block   = "10.0.0.0/16"

public_subnets = {
  "ap-south-1a" = "10.0.1.0/24"
  "ap-south-1b" = "10.0.2.0/24"
}

private_subnets = {
  "ap-south-1a" = "10.0.101.0/24"
  "ap-south-1b" = "10.0.102.0/24"
}
