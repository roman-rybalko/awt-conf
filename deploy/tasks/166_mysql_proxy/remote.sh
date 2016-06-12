#!/bin/sh -ex
. ./remote.conf

apt-get --yes --purge install mysql-proxy
chown root:root mysql-proxy
mv -vf mysql-proxy /etc/default/
