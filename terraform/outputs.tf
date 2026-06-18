output "alb_dns_name" {
  description = "ALB DNS name"
  value       = aws_lb.main.dns_name
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "target_group_arn" {
  description = "Target Group ARN"
  value       = aws_lb_target_group.web.arn
}

output "asg_name" {
  description = "Auto Scaling Group name"
  value       = aws_autoscaling_group.web.name
}
