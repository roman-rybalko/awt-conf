#!/bin/sh -ex
. ./remote.conf
cp -vf /etc/hosts /etc/hosts.bak
grep -v .hosts.advancedwebtesting.net /etc/hosts | grep -v deploy > /etc/hosts.new
cat hosts >> /etc/hosts.new
mv -vf /etc/hosts.new /etc/hosts
cat /etc/hosts
[ ! -e /etc/squid3 ] || service squid3 reload
