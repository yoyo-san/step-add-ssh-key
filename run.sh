# Step name options prefix: WERCKER_ADD_SSH_KEY

identityFilePath=$(mktemp)

privateKey=$(eval echo "\$${WERCKER_ADD_SSH_KEY_KEYNAME}_PRIVATE")
debug "Private key evaluated to: $privateKey"

echo -e "$privateKey" > $identityFilePath

function addKey() {
  sudo mkdir -p "$1/.ssh"
  sudo chown $2 "$1/.ssh"

  if [ ! -f $1/.ssh/config ]; then
    sudo echo "IdentityFile $identityFilePath" > $HOME/.ssh/config
    sudo chown $2 $1/.ssh/config
    sudo chmod 0600 $1/.ssh/config
  else
    sudo sed -i -e "1i IdentityFile $identifyFilePath" $HOME/.ssh/config
  fi
}

# Add for current user
addKey $HOME $USER
# Also add it for root
addKey "/root" "root"
