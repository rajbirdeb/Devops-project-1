#!/bin/bash

echo "🔴 Stopping previous application version..."

# Stop NGINX if you want to fully stop serving the site (optional)
# sudo systemctl stop nginx

# Clean old build files
sudo rm -rf /usr/share/nginx/html/*

echo "✅ Old build files removed from /usr/share/nginx/html"
