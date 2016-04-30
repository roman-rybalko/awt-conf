#!/bin/sh -ex
. ./remote.conf

mv -vf /etc/squid3/squid.conf.orig /etc/squid3/squid.conf.orig2
if ! patch -b /etc/squid3/squid.conf < squid-cn-3.1.conf.diff; then
	mv -vf /etc/squid3/squid.conf.orig /etc/squid3/squid.conf
	rm -vf /etc/squid3/squid.conf.rej
	patch -b /etc/squid3/squid.conf < squid-cn-3.4.conf.diff
fi
chmod -v 0400 /etc/squid3/squid.conf*
service squid3 reload
