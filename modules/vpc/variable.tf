variable "cidr_block" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "webapp_public_subnet_cidr_blocks" {
  type = list(string)
}

variable "webapp_private_subnet_cidr_blocks" {
  type = list(string)
}
