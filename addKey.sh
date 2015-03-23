#!/bin/bash

if [ ! -d "$1/.ssh" ]; then
   mkdir -p "$1/.ssh"
   chown $2 "$1/.ssh"
fi

if [ ! -f $1/.ssh/config ]; then
  if [ -z $5 ]; then
     echo -e "Host *\n    IdentityFile $3\n    Port $4" > $1/.ssh/config
  else
     echo -e "Host $5\n    IdentityFile $3    Port $4" > $1/.ssh/config
  fi
  chown $2 $1/.ssh/config
  chmod 0600 $1/.ssh/config
  echo "$1/.ssh/config created"
else
  # insert the text at line 1
  sed -i -e "1i \ \ \ \ IdentityFile $3\n    Port $4" $1/.ssh/config
  if [ -z $5 ]; then
    sed -i -e "1i Host *" $1/.ssh/config
  else
    sed -i -e "1i Host $5" $1/.ssh/config
  fi
  echo "$1/.ssh/config updated"
fi
