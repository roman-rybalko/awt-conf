#!/bin/sh -ex
. ./remote.conf

[ -z "`grep /swap /etc/fstab`" ]
[ ! -e /swap ]
dd if=/dev/zero of=/swap bs=1M count=`cat swap_size`
chmod a-rwx /swap
mkswap /swap
echo >> /etc/fstab
echo "/swap none swap sw 0 0" >> /etc/fstab
swapon -a
free
