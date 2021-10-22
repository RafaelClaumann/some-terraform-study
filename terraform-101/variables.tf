variable "region" {
  type        = string
  default     = "us-east-1"
  description = "define instance region"
}

variable "name" {
  type        = string
  default     = "ubuntu-server"
  description = "instance name"
}

variable "env" {
  type        = string
  default     = "dev"
  description = "instance environment"
}

variable "ami" {
  type        = string
  default     = "ami-02e136e904f3da870"
  description = "aws ami used to run instance"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "instance hardware configuration"
}

variable "repository" {
  type        = string
  default     = "https://github.com/RafaelClaumann/some-terraform-work"
  description = "application repository"
}
