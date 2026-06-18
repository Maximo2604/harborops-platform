variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "asg_min" {
  description = "ASG minimum instance count"
  type        = number
}

variable "asg_max" {
  description = "ASG maximum instance count"
  type        = number
}

variable "subnet_a_id" {
  description = "Public subnet A ID"
  type        = string
}

variable "subnet_b_id" {
  description = "Public subnet B ID"
  type        = string
}

variable "alb_sg_id" {
  description = "ALB security group ID"
  type        = string
}

variable "ec2_sg_id" {
  description = "EC2 security group ID"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "iam_instance_profile_name" {
  description = "IAM instance profile name"
  type        = string
}

variable "user_data" {
  description = "User data script"
  type        = string
}

variable "certificate_arn" {
  description = "ACM certificate ARN"
  type        = string
  default     = ""
}
