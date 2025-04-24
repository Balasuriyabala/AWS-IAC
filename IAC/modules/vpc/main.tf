# VPC 
resource "aws_vpc" "mytest" {
    cidr_block = var.vpc_cidr_block

    tags = {
      Name = "${var.project_name} -vpc"
    }
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.mytest.id

    tags = {
      Name = "${var.project_name}-igw"
    }  
}

# Public  Subnets
resource "aws_subnet" "public" {
    for_each = var.public_subnets

    vpc_id = aws_vpc.mytest.id
    cidr_block = each.value
    availability_zone = each.key
    map_public_ip_on_launch = true

    tags = {
      Name = "${var.project_name}-public-${each.key}"
    } 
}

# PRIVATE SUBNET
resource "aws_subnet" "private" {
    for_each = var.private_subnets

    vpc_id = aws_vpc.mytest.id
    cidr_block = each.value
    availability_zone = each.key

    tags = {
      Name = "${var.project_name}-private-${each.key}"
    }
}

# ROUTE TABLE
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.mytest.id

    route = {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway_igw.id
    }

    tags = {
        Name = "${var.project_name}-private-${each.key}"
    } 
}

# ROUTE TABLE ASSOCIATION FOR PUBLIC SUBNETS:
resource "aws_route_table_association" "publicrt" {
    for_each = aws_subnet.public
    subnet_id = each.value.id
    route_table_id = aws_route_table.public.id
  
}