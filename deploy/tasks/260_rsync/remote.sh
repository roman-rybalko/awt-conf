#!/bin/sh -ex
. ./remote.conf

apt-get --yes --purge install rsync

patch -b /etc/default/rsync < rsync.diff
mv -vf rsyncd.* /etc/
chmod -v a-w,og-rwx /etc/rsyncd.*
chown -v root:root /etc/rsyncd.*

update-rc.d rsync defaults
update-rc.d rsync enable
service rsync start
