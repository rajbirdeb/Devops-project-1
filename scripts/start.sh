#!/bin/bash

echo "🔵 Starting application..."

# Enable NGINX to start at boot (only needed once, but safe to leave)
sudo systemctl enable nginx

# Restart NGINX (safer than just "start" in case it's already running)
sudo systemctl restart nginx

echo "✅ NGINX started and serving content from /usr/share/nginx/html"
