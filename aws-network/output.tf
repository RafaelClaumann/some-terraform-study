output "my-vpc-arn" {
  value = aws_vpc.my-vpc.arn
}

output "my-vpc-default-acl" {
  value = aws_vpc.my-vpc.default_network_acl_id
}

output "my-vpc-default-sg" {
  value = aws_vpc.my-vpc.default_security_group_id
}

output "my-vpc-default-rt" {
  value = aws_vpc.my-vpc.default_route_table_id
}
 