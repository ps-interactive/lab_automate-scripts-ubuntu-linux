#!/bin/bash
if [ -z "$1" ]; then
  read -p "Enter a username: "
else
  REPLY="$1"
fi
sudo useradd -m -s /bin/bash "$REPLY"