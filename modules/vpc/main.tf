resource "aws_vpc" "webapp" {
  cidr_block = var.cidr_block

  tags = {
    Name = "webapp-vpc"
  }
}

resource 