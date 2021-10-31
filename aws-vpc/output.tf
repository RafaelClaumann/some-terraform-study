output "availability_zones_size" {
  value = length(var.availability_zones)
}

output "cidr_private_subnet" {
  value = aws_subnet.private.*.cidr_block
}

output "cidr_public_subnet" {
  value = aws_subnet.public.*.cidr_block
}
