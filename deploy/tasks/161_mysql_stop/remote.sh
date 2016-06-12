#!/bin/sh -ex
. ./remote.conf

service mysql stop
chmod -v 0444 disable.cnf
chown root:root -v disable.cnf
mv -vf disable.cnf /etc/mysql/conf.d/
