#!/bin/bash

# Step name options prefix: WERCKER_ADD_SSH_KEY

identityFilePath=$(mktemp)

privateKey=$(eval echo "\$${WERCKER_ADD_SSH_KEY_KEYNAME}_PRIVATE")
#debug "Private key evaluated to: $privateKey"

echo -e "$privateKey" > $identityFilePath

# Add for current user
$WERCKER_STEP_ROOT/addKey.sh $HOME $USER $identi
# Also add it for root
sudo $WERCKER_STEP_ROOT/addKey.sh /root root
