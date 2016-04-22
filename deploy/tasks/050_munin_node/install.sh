#! /bin/sh

set -x
set -e

apt-get --purge --yes autoremove munin-node
apt-get update

apt-get --purge --yes install munin-node
patch -b /etc/munin/munin-node.conf < munin-node.conf.diff

service munin-node restart
