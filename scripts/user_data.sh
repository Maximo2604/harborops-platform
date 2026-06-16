#!/bin/bash
set -e

# Update and install Apache
yum update -y
yum install -y httpd

# Start and enable Apache
systemctl start httpd
systemctl enable httpd

# Copy app files to web root
aws s3 cp s3://${S3_BUCKET}/app/index.html /var/www/html/index.html
aws s3 cp s3://${S3_BUCKET}/app/health.html /var/www/html/health.html
aws s3 cp s3://${S3_BUCKET}/app/slips.json /var/www/html/slips.json

# Set permissions
chmod 644 /var/www/html/index.html
chmod 644 /var/www/html/health.html
chmod 644 /var/www/html/slips.json

echo "HarborOps bootstrap complete" >> /var/log/harborops.log
