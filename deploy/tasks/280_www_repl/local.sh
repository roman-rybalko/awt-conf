#!/bin/sh -ex
. ./local.conf

[ -n "$RSYNC_PW" ]
echo $RSYNC_PW > awt-www-repl.pw

cp -av $SRCD/scripts/server/awt-www-repl.sh ./
