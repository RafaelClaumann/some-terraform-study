variable "aws_region" {
  description = "Current aws region"
  type        = string
  default     = "us-east-1"
}

variable "vpc-cidr-block" {
  description = "VPC CIDR block"
  type        = string
  default     =  "10.0.0.0/16"
}

variable "public-route-table-cidr-block" {
  description = "Route Table CIDR block"
  type        = string
  default     = "0.0.0.0/0"
}

variable "public-subnet-cidr-block" {
  description = "Public Subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}
