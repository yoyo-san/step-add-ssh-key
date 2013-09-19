# Step name options prefix: WERCKER_ADD_SSH_KEY

identityFilePath=$(mktemp)
echo -e "$MYPACKAGE_KEY_PRIVATE" > $identityFilePath

mkdir -p "$HOME/.ssh"

if [ ! -f $HOME/.ssh/config ]; then
  echo "IdentityFile $identityFilePath" > $HOME/.ssh/config
  chmod 0600 config
else
  sed -i -e "1i IdentityFile $identifyFilePath" $HOME/.ssh/config
fi
