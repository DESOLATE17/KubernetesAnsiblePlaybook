#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

USERNAME=$1

if id "$USERNAME" &>/dev/null; then
  echo "User $USERNAME already exists."
  exit 0
fi

PASSWORD=$2

useradd -m -s /bin/bash $USERNAME
echo "$USERNAME:$PASSWORD" | chpasswd

# Add user to sudo group (optional)
usermod -aG sudo $USERNAME

# Log the username and password
# echo "User created: $USERNAME"
# echo "Password: $PASSWORD"
