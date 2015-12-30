#!/bin/sh -ex
. ./remote.conf

WD=`pwd`

cd /tmp/
chown -v root:root $WD/p
chmod -v 0400 $WD/p
rsync -aSvz --progress --password-file=$WD/p rsync://`cat $WD/u`@`cat $WD/h`:$RSYNC_PORT/bak/munin.tar /tmp/munin.tar

cd /var/lib/
rm -Rvf munin.old
mv -vf munin munin.old
tar -xvf /tmp/munin.tar
rm -vf /tmp/munin.tar
