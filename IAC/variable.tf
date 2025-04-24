variable "project_name" {
  type        = string
  description = "Project name"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for VPC"
}

variable "public_subnets" {
  type        = map(string)
  description = "Public subnet map of AZ to CIDR"
}

variable "private_subnets" {
  type        = map(string)
  description = "Private subnet map of AZ to CIDR"
}
