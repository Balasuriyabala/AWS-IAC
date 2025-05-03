# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = "my_vpc"
  }
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "igw"
  }
}

# SUBNETS
resource "aws_subnet" "public1a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_block_public1a
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public1a"
  }
}

resource "aws_subnet" "public1b" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_block_public1b
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public1b"
  }
}

resource "aws_subnet" "private1a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_block_private1a
  availability_zone       = "ap-south-1c"
  map_public_ip_on_launch = false

  tags = {
    Name = "private1a"
  }
}

# PUBLIC ROUTE TABLE
resource "aws_route_table" "publicRT1a" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "PublicRouteTable1a"
  }
}

resource "aws_route_table" "publicRT1b" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "PublicRouteTable1b"
  }
}

# PRIVATE ROUTE TABLE
resource "aws_route_table" "privateRT" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "PrivateRouteTable"
  }
}

# ROUTE TABLE ASSOCIATIONS
# Associate Public Subnets to Public Route Table
resource "aws_route_table_association" "public1a_assoc" {
  subnet_id      = aws_subnet.public1a.id
  route_table_id = aws_route_table.publicRT1a.id
}

resource "aws_route_table_association" "public1b_assoc" {
  subnet_id      = aws_subnet.public1b.id
  route_table_id = aws_route_table.publicRT1b.id
}

# Associate Private Subnet to Private Route Table
resource "aws_route_table_association" "private1a_assoc" {
  subnet_id      = aws_subnet.private1a.id
  route_table_id = aws_route_table.privateRT.id
}