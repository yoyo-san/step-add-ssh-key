#!/bin/bash

if [ ! -d "$1/.ssh" ]; then
   mkdir -p "$1/.ssh"
   chown $2 "$1/.ssh"
   echo "doesn't exist yet $1/.ssh"
fi

if [ ! -f $1/.ssh/config ]; then
  echo "IdentityFile $3" > $1/.ssh/config
  chown $2 $1/.ssh/config
  chmod 0600 $1/.ssh/config
  echo "$1/.ssh/config created"
else
  sed -i -e "1i IdentityFile $3" $1/.ssh/config
  echo "$1/.ssh/config updated"
fi
