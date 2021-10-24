output "vpc-id" {
  value = aws_vpc.my-vpc.id
}

output "internet-gateway-id" {
  value = aws_internet_gateway.my-igw.id
}

output "public-subnet-id" {
  value = aws_subnet.public-subnet.id
}

output "public-subnet-az" {
  value = aws_subnet.public-subnet.availability_zone
}

output "route-table-id" {
  value = aws_route_table.route-table.id
}

output "security-group-id" {
  value = aws_security_group.http-ssh-security-group.id
}

output "security-group-ingress" {
  value = aws_security_group.http-ssh-security-group.ingress
}

output "security-group-egress" {
  value = aws_security_group.http-ssh-security-group.egress
}
