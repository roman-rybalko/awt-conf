#! /bin/sh

set -e
set -x

cd "`dirname "$0"`"
. config.sh
cd client
pgrep ${NODE_ID}-x || nohup npm run-script x >> ../x.log &
while ! [ -e "$X_FILE" ]; do sleep 1; done
pgrep ${NODE_ID}-selenium || HOME="$SEL_HOME" nohup npm run-script selenium >> ../selenium.log &
while ! GET "$SEL_ADDR"; do sleep 1; done
pgrep ${NODE_ID}-batch || nohup npm run-script batch >> ../batch.log &
