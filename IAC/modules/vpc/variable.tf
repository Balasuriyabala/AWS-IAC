variable "project_name" {
    description = "Project name"
    type = string  
}

variable "vpc_cidr_block" {
    description = "CIDR block for VPC"
    type = string  
}

variable "public_subnets" {
    description = "CIDR For Public subnets"
    type = map(string) 
}  

variable "private_subnets" {
    description = "CIDR For Private Subnets"
    type = map(string)
}