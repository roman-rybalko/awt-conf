#!/bin/sh -ex
. ./remote.conf

[ ! -e /etc/default/mysql-proxy ]

apt-get --yes --purge install mysql-proxy
chown root:root mysql-proxy
mv -vf mysql-proxy /etc/default/
update-rc.d mysql-proxy defaults
update-rc.d mysql-proxy enable
