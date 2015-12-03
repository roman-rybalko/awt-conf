#! /bin/sh

set -x
set -e

apt-get --purge --yes install squid3
chown proxy:root passwd
chmod 0600 passwd
mv passwd /etc/squid3/
patch -b /etc/squid3/squid.conf < squid.conf.diff
