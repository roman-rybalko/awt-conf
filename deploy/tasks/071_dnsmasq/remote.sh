#!/bin/sh -ex
. ./remote.conf

cat /etc/resolv.conf

apt-get update
apt-get --yes --purge install dnsmasq
cp -v localhost.conf /etc/dnsmasq.d/
chown -v root:root /etc/dnsmasq.d/*
patch -b /etc/default/dnsmasq < dnsmasq.patch

chattr -i /etc/resolv.conf || true
echo 'nameserver 127.0.0.1' > /etc/resolv.conf.new
cat /etc/resolv.conf >> /etc/resolv.conf.new
mv -vf /etc/resolv.conf.new /etc/resolv.conf
chattr +i /etc/resolv.conf || true

cat /etc/resolv.conf
service dnsmasq stop
service dnsmasq start
service dnsmasq status

service squid3 reload || true
