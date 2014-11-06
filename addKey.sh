#!/bin/bash

if [ ! -d "$1/.ssh" ]; then
   mkdir -p "$1/.ssh"
   chown $2 "$1/.ssh"
fi

if [ ! -f $1/.ssh/config ]; then
  echo "Host $4\n\tIdentityFile $3" > $1/.ssh/config
  chown $2 $1/.ssh/config
  chmod 0600 $1/.ssh/config
  echo "$1/.ssh/config created"
else
  # insert the text at line 1
  sed -i -e `echo "1i Host $4\n\tIdentityFile $3"` $1/.ssh/config
  echo "$1/.ssh/config updated"
fi
