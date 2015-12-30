#!/bin/sh -ex
. ./remote.conf

apt-get update
apt-get --yes --purge install php5-fpm

[ ! -e /etc/php5/fpm/pool.d/www.conf ] || mv -vf /etc/php5/fpm/pool.d/www.conf /etc/php5/fpm/pool.d/www.conf.orig
mv -vf conf.d/* /etc/php5/fpm/conf.d/
mv -vf pool.d/* /etc/php5/fpm/pool.d/
chown -v root:root /etc/php5/fpm/conf.d/* /etc/php5/fpm/pool.d/*
chmod -v 0444 /etc/php5/fpm/conf.d/* /etc/php5/fpm/pool.d/*

service php5-fpm restart
