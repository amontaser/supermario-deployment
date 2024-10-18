variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
}

variable "availability_zone" {
  description = "Availability zone for resources"
}

variable "env_prefix" {
  description = "Prefix for resource names"
}

variable "instance_type" {
  description = "EC2 instance type"
}

