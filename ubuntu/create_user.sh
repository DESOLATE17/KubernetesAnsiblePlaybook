#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Usage: $0 <username> [password]"
  exit 1
fi

USERNAME=$1
PASSWORD=${2:-$(openssl rand -base64 12)}  # Generate random password if not provided

# Check if user already exists
if id "$USERNAME" &>/dev/null; then
  echo "User $USERNAME already exists."
  exit 0
fi

# Create user with home directory and bash shell
useradd -m -s /bin/bash "$USERNAME" || {
  echo "Failed to create user $USERNAME"
  exit 1
}

# Set password
echo "$USERNAME:$PASSWORD" | chpasswd || {
  echo "Failed to set password for $USERNAME"
  exit 1
}

# Add to sudo group
usermod -aG sudo "$USERNAME" && echo "Added $USERNAME to sudo group"

echo "User $USERNAME created successfully"
echo "Password: $PASSWORD"