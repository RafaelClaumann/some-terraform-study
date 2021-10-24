variable "aws_region" {
  description = "Current aws region"
  type        = string
  default     = "us-east-1"
}

variable "programmatic-access-profile" {
  description = "profile name for an user with programmatic access to aws"
  type = string
  default = "default"
}

variable "vpc-name" {
  description = "Defines vpc name tag"
  type        = string
  default     = "my-vpc-default-name"
}

variable "vpc-cidr-block" {
  description = "VPC CIDR block"
  type        = string
  # default     = "10.0.0.0/16"
}

variable "public-subnet-name" {
  description = "Defines public subnet name tag"
  type        = string
  default     = "my-public-subnet-default-name"
}

variable "public-subnet-cidr-block" {
  description = "Public Subnet CIDR block"
  type        = string
  # default     = "10.0.1.0/24"
}

variable "internet-gateway-name" {
  description = "Defines internet gateway name tag"
  type        = string
  default     = "internet-gateway-default-name"
}

variable "route-table-name" {
  description = "Defines route table name tag"
  type        = string
  default     = "route-table-default-name"
}

variable "route-table-cidr-block" {
  description = "Route Table CIDR block"
  type        = string
  # default     = "0.0.0.0/0"
}

variable "security-group-name" {
  description = "Defines security group name tag"
  type        = string
  default     = "http-ssh-security-group-default-name"
}
