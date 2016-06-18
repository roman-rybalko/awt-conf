#!/bin/sh -ex
. ./remote.conf
cp -vf /etc/hosts /etc/hosts.bak
grep -v .hosts.advancedwebtesting.net /etc/hosts | grep -v deploy > /etc/hosts.new
cat hosts >> /etc/hosts.new
chattr -i /etc/hosts || true
mv -vf /etc/hosts.new /etc/hosts
chattr +i /etc/hosts || true
cat /etc/hosts

service squid3 reload || true
service dnsmasq reload || true
