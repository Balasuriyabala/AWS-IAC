output "vpc_id" {
  value = aws_vpc.mytest.id
}

output "public_subnets_ids" {
  value = [for s in awaws_subnet.public : s.id] 
}

output "privatec_subnets_ids" {
  value = [for s in awaws_subnet.private : s.id] 
}