output "alb_dns_name" {
  description = "ALB DNS name"
  value       = aws_lb.main.dns_name
}

output "alb_arn_suffix" {
  description = "ALB ARN suffix"
  value       = aws_lb.main.arn_suffix
}

output "target_group_arn" {
  description = "Target Group ARN"
  value       = aws_lb_target_group.web.arn
}

output "target_group_arn_suffix" {
  description = "Target Group ARN suffix"
  value       = aws_lb_target_group.web.arn_suffix
}

output "asg_name" {
  description = "Auto Scaling Group name"
  value       = aws_autoscaling_group.web.name
}
