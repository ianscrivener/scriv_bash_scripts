#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display script usage
usage() {
    echo "Usage: $0 [additional_ports...]"
    echo "Example: $0 3333 8080 9090"
    echo "This will add the specified ports to the existing UFW configuration non-interactively."
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

# Allow additional ports specified as arguments
for port in "$@"
do
    if [[ "$port" =~ ^[0-9]+$ ]]; then
        echo "Adding custom port: $port"
        ufw allow "$port"/tcp
        ufw allow "$port"/udp
    else
        echo "Invalid port number: $port. Skipping."
    fi
done

# Reload UFW to apply changes without prompting
ufw --force reload

# Display ufw status
ufw status verbose

echo "Additional ports have been added to UFW configuration."