resource "aws_vpc" "webapp" {
  cidr_block = var.cidr_block

  tags = {
    Name = "webapp-vpc"
  }
}

# Create internet gateway
resource "aws_internet_gateway" "webapp_igw" {
  vpc_id = aws_vpc.webapp.id

  tags = {
    Name = "webapp-igw"
  }
}

# Create public subnets
resource "aws_subnet" "public_subnet" {
  count = length(var.webapp_public_subnet_cidr_blocks)
  vpc_id = aws_vpc.webapp.id   
  cidr_block = var.webapp_public_subnet_cidr_blocks[count.index]
  availability_zone = var.cidr_block[count.index]
}

# Create private subnets
resource "aws_subnet" "private_subnet" {
  count = length(var.webapp_private_subnet_cidr_blocks)
  vpc_id = aws_vpc.webapp.id
  cidr_block = var.webapp_private_subnet_cidr_blocks[count.index]
  availability_zone = var.cidr_block[count.index]
}