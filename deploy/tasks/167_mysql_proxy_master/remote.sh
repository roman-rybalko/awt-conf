#!/bin/sh -ex
. ./remote.conf

sed -i "s/MYSQL_PORT/$MYSQL_PORT/" mysql-proxy.cnf
chmod -v 0400 mysql-proxy.cnf
chown root:root -v mysql-proxy.cnf
mv -vf mysql-proxy.cnf /etc/mysql/

service mysql-proxy start
service mysql-proxy stop
service mysql-proxy start
