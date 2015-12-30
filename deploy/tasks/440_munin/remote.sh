#!/bin/sh -ex
. ./remote.conf

apt-get update
apt-get --yes --purge install munin

mv -vf awt /etc/munin/munin-conf.d/
chown -v root:root /etc/munin/munin-conf.d/*
chmod -v 0444 /etc/munin/munin-conf.d/*
