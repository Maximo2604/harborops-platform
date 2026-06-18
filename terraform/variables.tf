variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "harborops"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI ID"
  type        = string
  default     = "ami-0521cb2d60cfbb1a6"
}

variable "s3_bucket" {
  description = "S3 bucket for app files"
  type        = string
  default     = "harborops-assets"
}
variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "asg_min" {
  description = "ASG minimum instance count"
  type        = number
  default     = 2
}

variable "asg_max" {
  description = "ASG maximum instance count"
  type        = number
  default     = 6
}
