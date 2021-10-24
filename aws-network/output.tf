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

output "my-internet-gateway-arn" {
  value = aws_internet_gateway.my-igw.arn
}

output "public-subnet-arn" {
  value = aws_subnet.public-subnet.arn
}

output "public-subnet-az" {
  value = aws_subnet.public-subnet.availability_zone
}

output "public-subnet-cidr" {
  value = aws_subnet.public-subnet.cidr_block
}
