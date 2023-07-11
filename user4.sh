#!/bin/bash
if [ -z "$1" ]; then
  read -p "Enter a username: "
  usernames=("$REPLY")
else
  usernames=("$@")
fi

for username in "${usernames[@]}"; do
  while grep -q "$username" /etc/passwd  ; do
    read -p "The '$username' user exists, please choose another name: " new_username
    username="$new_username"
  done
  sudo useradd -m -s /bin/bash "$username"
  echo "$username:Password1" | sudo chpasswd
  getent passwd "$username"
  sudo getent shadow "$username"
done