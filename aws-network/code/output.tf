output "vpc-id" {
  description = "vpc_id output from network-module"
  value       = module.network.vpc-id
}

output "internet-gateway-id" {
  description = "internet_gateway_id output from network-module"
  value       = module.network.internet-gateway-id
}

output "public-subnet-id" {
  description = "public_subnet_id output from network-module"
  value       = module.network.public-subnet-id
}

output "public-subnet-az" {
  description = "public_subnet_az output from network-module"
  value       = module.network.public-subnet-az
}

output "public-route-table-id" {
  description = "public_route_table_id output from network-module"
  value       = module.network.route-table-id
}

output "security-group-id" {
  description = "security_group_id output from network-module"
  value       = module.network.security-group-id
}

output "security-group-ingress" {
  description = "security_group_ingress_rules output from network-module"
  value       = module.network.security-group-ingress
}

output "security-group-egress" {
  description = "security_group_egress_rules output from network-module"
  value       = module.network.security-group-egress
}

output "ec2-public-ip" {
  description = "public-ip output from ec2-instance-resource"
  value       = aws_instance.ubuntu.public_ip
}
