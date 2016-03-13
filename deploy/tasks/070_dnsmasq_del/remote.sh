#!/bin/sh -ex
. ./remote.conf

cat /etc/resolv.conf

chattr -i /etc/resolv.conf || true
sed -i '/127.0.0.1/ d' /etc/resolv.conf
chattr +i /etc/resolv.conf || true

apt-get --yes --purge autoremove dnsmasq
rm -Rvf /etc/dnsmasq.d

cat /etc/resolv.conf
