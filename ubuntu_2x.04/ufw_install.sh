#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update package lists
apt-get update

# Install ufw without prompts
DEBIAN_FRONTEND=noninteractive apt-get install -y ufw

# Set default policies
ufw default deny incoming
ufw default allow outgoing

# Allow SSH (port 22) to maintain remote access
ufw allow ssh
ufw allow 22/tcp  # Explicitly allow port 22 for SSH

# Allow other common ports (customize as needed)
ufw allow 80/tcp  # HTTP
ufw allow 443/tcp # HTTPS

# Enable ufw without prompt
echo "y" | ufw enable

# Display ufw status
ufw status verbose

echo "UFW setup completed successfully."