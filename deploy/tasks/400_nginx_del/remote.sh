#!/bin/sh -ex
. ./remote.conf

apt-get --yes --purge remove nginx nginx-common
apt-get --yes --purge autoremove
rm -Rvf /etc/nginx /var/lib/nginx /var/www.old
[ ! -e /var/www ] || mv -vf /var/www /var/www.old
