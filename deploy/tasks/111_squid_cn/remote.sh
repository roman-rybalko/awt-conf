#!/bin/sh -ex
. ./remote.conf

mv -vf /etc/squid3/squid.conf.orig /etc/squid3/squid.conf.orig2
patch -b /etc/squid3/squid.conf < squid-cn-3.4.conf.diff
chmod -v 0400 /etc/squid3/squid.conf*
service squid3 reload
