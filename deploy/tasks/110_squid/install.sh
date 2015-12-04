#! /bin/sh

set -x
set -e

apt-get update
apt-get --purge --yes install squid3
chown -v proxy:root passwd
chmod -v 0400 passwd
mv -vf passwd /etc/squid3/
if ! patch -b /etc/squid3/squid.conf < squid-3.1.conf.diff; then
	mv -vf /etc/squid3/squid.conf.orig /etc/squid3/squid.conf
	rm -vf /etc/squid3/squid.conf.*
	patch -b /etc/squid3/squid.conf < squid-3.4.conf.diff
fi
service squid3 reload

chown -v root:root squid
mv -vf squid /etc/munin/plugin-conf.d/
ln -svf /usr/share/munin/plugins/squid_* /etc/munin/plugins/
service munin-node restart
