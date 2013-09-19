# Step name options prefix: WERCKER_ADD_SSH_KEY

identityFilePath=$(mktemp)

command="echo \"\$$WERCKER_ADD_SSH_KEY_KEYNAME_PRIVATE\""
privateKey=$($command)
debug "Private key evaluated to: $privateKey"

echo -e "$privateKey" > $identityFilePath

mkdir -p "$HOME/.ssh"

if [ ! -f $HOME/.ssh/config ]; then
  echo "IdentityFile $identityFilePath" > $HOME/.ssh/config
  chmod 0600 $HOME/.ssh/config
else
  sed -i -e "1i IdentityFile $identifyFilePath" $HOME/.ssh/config
fi
