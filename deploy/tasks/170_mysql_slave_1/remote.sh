#!/bin/sh -ex
. ./remote.conf

WD=`pwd`

cd /tmp/
chown -v root:root $WD/p
chmod -v 0400 $WD/p
rsync -aSvz --progress --password-file=$WD/p rsync://`cat $WD/u`@`cat $WD/h`:$RSYNC_PORT/bak/db.sql /tmp/db.sql
