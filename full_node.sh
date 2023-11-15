#!/bin/bash


CurrentScriptDir="$(
  cd "$(dirname $0)" || exit
  pwd
)"


LOGLEVEL="info"

HOMEDIR=$CurrentScriptDir/node_full
PATH=$PATH:$CurrentScriptDir/build

echo "HOMEDIR:$HOMEDIR"
echo "PATH:$PATH"

TRACE=""

# Path variables
CONFIG=$HOMEDIR/config/config.toml
APP_TOML=$HOMEDIR/config/app.toml
GENESIS=$HOMEDIR/config/genesis.json
TMP_GENESIS=$HOMEDIR/config/tmp_genesis.json


# used to exit on first error (any non-zero exit code)
set -e


## Start the node 
umUTONd start --metrics "$TRACE" --log_level $LOGLEVEL --minimum-gas-prices=1000aclv --json-rpc.api eth,txpool,personal,net,debug,web3 --api.enable --home "$HOMEDIR"


