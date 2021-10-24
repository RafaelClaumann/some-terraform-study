output "my-vpc-id" {
  value = aws_vpc.my-vpc.id
}

output "my-internet-gateway-id" {
  value = aws_internet_gateway.my-igw.id
}

output "public-subnet-id" {
  value = aws_subnet.public-subnet.id
}

output "public-subnet-az" {
  value = aws_subnet.public-subnet.availability_zone
}

output "public-route-table-id" {
  value = aws_route_table.public-route-table.id
}

output "public-route-table-igw-id" {
  value = aws_route_table.public-route-table.tags["igw-id"]
}

output "public-route-table-vpc-id" {
  value = aws_route_table.public-route-table.tags["vpc-id"]
}
