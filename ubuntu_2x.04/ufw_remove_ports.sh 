#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display script usage
usage() {
    echo "Usage: $0 [ports_to_remove...]"
    echo "Example: $0 3333 8080 9090"
    echo "This will remove the specified ports from the existing UFW configuration non-interactively."
}

# Check if script is run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Check if UFW is installed
if ! command -v ufw &> /dev/null; then
    echo "UFW is not installed. Please install and configure UFW first."
    exit 1
fi

# Check if any ports were provided as arguments
if [ $# -eq 0 ]; then
    echo "No ports specified."
    usage
    exit 1
fi

# Remove specified ports from UFW configuration
for port in "$@"
do
    if [[ "$port" =~ ^[0-9]+$ ]]; then
        echo "Removing port: $port"
        ufw delete allow "$port"/tcp
        ufw delete allow "$port"/udp
    else
        echo "Invalid port number: $port. Skipping."
    fi
done

# Reload UFW to apply changes without prompting
ufw --force reload

# Display ufw status
ufw status verbose

echo "Specified ports have been removed from UFW configuration."