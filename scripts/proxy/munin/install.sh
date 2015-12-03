#! /bin/sh

set -x
set -e

apt-get --purge --yes install munin-node
chown root:root squid
mv squid /etc/munin/plugin-conf.d/
patch -b /etc/munin/munin-node.conf < munin-node.conf.diff
