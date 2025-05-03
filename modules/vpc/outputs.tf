output "public_subnet_ids" {
  value = [aws_subnet.public1a.id, aws_subnet.public1b.id]
}

output "private_subnet_ids" {
  value = [aws_subnet.private1a.id]
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}