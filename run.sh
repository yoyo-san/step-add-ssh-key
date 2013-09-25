# Step name options prefix: WERCKER_ADD_SSH_KEY

identityFilePath=$(mktemp)

privateKey=$(eval echo "\$${WERCKER_ADD_SSH_KEY_KEYNAME}_PRIVATE")
debug "Private key evaluated to: $privateKey"

echo -e "$privateKey" > $identityFilePath

function addKey() {
  if ! sudo -u $2 test -d "$1/.ssh"; then
     sudo mkdir -p "$1/.ssh"
     sudo chown $2 "$1/.ssh"
     echo "doesn't exist yet $1/.ssh"
  fi
  
  if ! sudo test -f $1/.ssh/config ; then
    echo "config doesn't exist  $1/.ssh/config"
    sudo echo "IdentityFile $identityFilePath" > $1/.ssh/config
    sudo chown $2 $1/.ssh/config
    sudo chmod 0600 $1/.ssh/config
  else
    echo "config does exist"
    sudo -c `sed -i -e "1i IdentityFile $identifyFilePath" $1/.ssh/config`
  fi
}

# Add for current user
addKey $HOME $USER
# Also add it for root
addKey "/root" "root"
