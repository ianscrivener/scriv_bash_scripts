#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update package lists
sudo apt-get update

# Install ufw without prompts
DEBIAN_FRONTEND=noninteractive sudo apt-get install -y ufw

# Set default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH (port 22) to maintain remote access
sudo ufw allow ssh
sudo ufw allow 22/tcp  # Explicitly allow port 22 for SSH

# Allow other common ports (customize as needed)
sudo ufw allow 80/tcp  # HTTP
sudo ufw allow 443/tcp # HTTPS

# Enable ufw without prompt
sudo echo "y" | ufw enable

# Display ufw status
sudo ufw status verbose

echo "UFW setup completed successfully."