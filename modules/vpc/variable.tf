variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones to use for the subnets."
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"] 
}

variable "webapp_public_subnet_cidr_blocks" {
  description = "List of CIDR blocks for the public subnets."
  type        = list(string)
  default     = ["10.0.0.5/24", "10.0.0.6/24"]  
}