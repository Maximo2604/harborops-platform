output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_a_id" {
  description = "Public subnet A ID"
  value       = aws_subnet.public_a.id
}

output "public_subnet_b_id" {
  description = "Public subnet B ID"
  value       = aws_subnet.public_b.id
}

output "alb_sg_id" {
  description = "ALB security group ID"
  value       = aws_security_group.alb.id
}

output "ec2_sg_id" {
  description = "EC2 security group ID"
  value       = aws_security_group.ec2.id
}
