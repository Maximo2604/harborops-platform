# ⚓ HarborOps Platform

Marina Slip Management System — Deployed on AWS

## Architecture
- **EC2** — Apache web server serving the HarborOps app
- **ALB** — Application Load Balancer with health checks
- **VPC** — Custom VPC with public subnets across 2 AZs
- **S3** — App file storage and Terraform state backend
- **GitHub Actions** — CI/CD pipeline on push to main

## Deploy
1. Add GitHub Secrets: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, S3_BUCKET
2. Push to main branch
3. GitHub Actions will run Terraform and deploy

## App Endpoints
- / — HarborOps branded homepage
- /health.html — ALB health check (returns 200)
- /slips.json — Marina slip availability data
