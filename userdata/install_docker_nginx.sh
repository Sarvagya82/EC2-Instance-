#!/bin/bash
set -e

# Update and install required packages
apt-get update
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce

# Install NGINX
apt-get install -y nginx

# Start and enable services
systemctl start docker
systemctl enable docker
systemctl start nginx
systemctl enable nginx

# Create a simple Docker container
docker run -d -p 8080:80 --name web-container nginx:alpine

# Configure NGINX for domain-based routing
cat > /etc/nginx/sites-available/default <<EOL
server {
    listen 80;
    server_name ec2-instance.*;
    return 200 'Hello from Instance';
}

server {
    listen 80;
    server_name ec2-docker.*;
    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOL

# Reload NGINX to apply changes
systemctl reload nginx
