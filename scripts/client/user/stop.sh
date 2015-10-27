#! /bin/sh

set -e
set -x

cd "`dirname "$0"`"
. config.sh
for s in batch selenium x; do
	pgrep ${NODE_ID}-$s | xargs kill
	while pgrep ${NODE_ID}-$s; do sleep 1; done
done
