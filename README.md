# ⚓ HarborOps Platform

## Project Overview
HarborOps is a marina slip management platform built and deployed on AWS. This project provisions a full AWS environment using Terraform, serving a branded web application via an EC2 instance behind 
an Application Load Balancer. The platform exposes endpoints for the homepage, health checks, slip availability data, and instance metadata.

## Architecture
![Architecture](docs/architecture.png)

## Tech Stack
- **EC2** — Hosts the Apache web server and application files
- **ALB** — Application Load Balancer routing HTTP traffic to EC2
- **VPC** — Custom VPC with public subnets across 2 availability zones
- **S3** — Terraform remote state backend
- **IAM** — Permissions for deployment
- **GitHub Actions** — CI/CD pipeline for automated deploys

## Prerequisites
- Terraform v1.0+
- AWS CLI configured with valid credentials
- Git
- An AWS account with EC2, ALB, VPC, and S3 permissions

## Bootstrap (run once before terraform init)
The S3 bucket for remote state must exist before running terraform init.
Create it manually:

## Deployment Steps

## How CI/CD Works
On every push to the main branch, GitHub Actions runs automatically. It configures AWS credentials using repository secrets, sets up Terraform, runs terraform init and plan to validate the 
infrastructure, then applies the changes with terraform apply. App files are also synced to S3 on each deploy.

## Live Endpoint
http://harborops-alb-858816696.us-east-1.elb.amazonaws.com

## AWS Region
us-east-1 (N. Virginia)

## Golden AMI
- **AMI ID:** ami-04939952b25b7d46e
- **Created:** 2025-06-17
- **Base:** Amazon Linux 2023, t3.micro
- **Includes:** Apache httpd, HarborOps app files, EBS volume mounted at /data/marina

## GitHub Secrets
- `AWS_ACCESS_KEY_ID` — AWS credentials for Terraform and CLI access
- `AWS_SECRET_ACCESS_KEY` — AWS credentials for Terraform and CLI access
- `S3_BUCKET` — S3 bucket name for app file storage

## Cleanup

Note: Manually delete the S3 buckets after destroy to avoid orphaned resources:
