output "alb_dns_name" {
  description = "ALB DNS name"
  value       = module.compute.alb_dns_name
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "target_group_arn" {
  description = "Target Group ARN"
  value       = module.compute.target_group_arn
}

output "asg_name" {
  description = "Auto Scaling Group name"
  value       = module.compute.asg_name
}
