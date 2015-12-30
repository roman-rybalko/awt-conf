#!/bin/sh -ex
. ./remote.conf

apt-get --yes --purge remove munin munin-node
apt-get --yes --purge autoremove
rm -Rvf /etc/munin /var/lib/munin-* /var/lib/munin.old
[ ! -e /var/lib/munin ] || mv -vf /var/lib/munin /var/lib/munin.old
