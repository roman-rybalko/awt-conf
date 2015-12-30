#!/bin/sh -ex
. ./remote.conf

apt-get --yes --purge remove mysql-server
apt-get --yes --purge autoremove
rm -Rvf /etc/mysql /var/lib/mysql.old
[ ! -e /var/lib/mysql ] || mv -vf /var/lib/mysql /var/lib/mysql.old
