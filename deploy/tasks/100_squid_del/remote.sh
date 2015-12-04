#!/bin/sh -x
. ./remote.conf

apt-get --purge --yes remove squid3
apt-get --purge --yes autoremove
rm -Rvf /etc/squid3 /var/spool/squid3

rm -Rvf /etc/munin/plugin-conf.d/squid /etc/munin/plugins/squid_*
service munin-node restart
