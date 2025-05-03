variable "cidr_block" {
    type = string
    description = "custom vpc"
    default = "10.0.0.0/16"

}

variable "instance_tenancy" {
  description = "Instance tenancy for the VPC"
  type        = string
  default     = "default" 
} 

variable "cidr_block_public1a" {
    type = string
    default = "10.0.1.0/24"
} 

variable "cidr_block_public1b" {
    type = string
    default = "10.0.2.0/24"
}

variable "cidr_block_private1a" {
    type = string
    default = "10.0.103.0/24"
} 

variable "cidr_block_private1b" {
    type = string
    default = "10.0.104.0/24"
} 