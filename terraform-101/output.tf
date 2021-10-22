output "instance_arn" {
  value = aws_instance.ubuntu.arn
}

output "public_ip" {
  value = aws_instance.ubuntu.public_ip
}

output "private_ip" {
  value = aws_instance.ubuntu.private_ip
}

output "security_groups" {
  value = aws_instance.ubuntu.security_groups
}

output "availability_zone" {
  value = aws_instance.ubuntu.availability_zone
}

output "tags" {
  value = aws_instance.ubuntu.tags_all
}
