#!/bin/bash
set -e

# Install and enable Apache
dnf update -y
dnf install -y httpd
systemctl start httpd
systemctl enable httpd

# Copy app files
cat > /var/www/html/index.html << 'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>HarborOps Platform</title>
  <style>
    body { font-family: Arial, sans-serif; background: #0a1628; color: #ffffff; text-align: center; padding: 60px; }
    h1 { font-size: 3em; color: #00aaff; }
    p { font-size: 1.2em; color: #aaccee; }
    .badge { background: #00aaff; color: #0a1628; padding: 8px 20px; border-radius: 20px; font-weight: bold; }
  </style>
</head>
<body>
  <h1>⚓ HarborOps Platform</h1>
  <p>Marina Slip Management — Powered by AWS</p>
  <br/>
  <span class="badge">Operational</span>
</body>
</html>
HTML

cat > /var/www/html/health.html << 'HTML'
<!DOCTYPE html>
<html>
<head><title>Health Check</title></head>
<body>OK</body>
</html>
HTML

cat > /var/www/html/slips.json << 'JSON'
{
  "marina": "HarborOps Marina",
  "updated": "2025-01-01",
  "slips": [
    { "id": "A1", "length_ft": 30, "available": true, "rate_per_night": 45 },
    { "id": "A2", "length_ft": 40, "available": false, "rate_per_night": 60 },
    { "id": "B1", "length_ft": 50, "available": true, "rate_per_night": 75 },
    { "id": "B2", "length_ft": 60, "available": true, "rate_per_night": 95 },
    { "id": "C1", "length_ft": 35, "available": false, "rate_per_night": 55 }
  ]
}
JSON

# IMDSv2 token flow for /status
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/instance-id)

AZ=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/placement/availability-zone)

cat > /var/www/html/status << JSON
{"instance_id": "$INSTANCE_ID", "availability_zone": "$AZ"}
JSON

chmod 644 /var/www/html/index.html /var/www/html/health.html /var/www/html/slips.json /var/www/html/status

# Install and configure CloudWatch Agent
dnf install -y amazon-cloudwatch-agent

cat > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json << 'CWCONFIG'
{
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "/var/log/httpd/access_log",
            "log_group_name": "/harborops/apache/access",
            "log_stream_name": "{instance_id}",
            "timezone": "UTC"
          }
        ]
      }
    }
  }
}
CWCONFIG

/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config \
  -m ec2 \
  -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json \
  -s

echo "HarborOps bootstrap complete" >> /var/log/harborops.log
