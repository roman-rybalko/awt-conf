#!/bin/sh -ex
. ./remote.conf

apt-get --yes --purge remove php5-fpm php5-cli php-pear php5-common
apt-get --yes --purge autoremove
rm -Rvf /etc/php5 /var/lib/php5
