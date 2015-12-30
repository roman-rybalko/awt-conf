#!/bin/sh -ex
. ./remote.conf

apt-get update
apt-get --yes --purge install rsync

patch -b /etc/default/rsync < rsync.diff
mv -vf rsyncd.* /etc/
chmod -v a-w,og-rwx /etc/rsyncd.*
chown -v root:root /etc/rsyncd.*

service rsync start
