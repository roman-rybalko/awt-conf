#!/bin/sh -ex
. ./remote.conf

MYSQL_MASTER4=`cat mysql_master4`
[ -n "$MYSQL_MASTER4" ]

sed -i "s/MYSQL_MASTER/$MYSQL_MASTER4/" mysql-proxy.cnf
sed -i "s/MYSQL_PORT/$MYSQL_PORT/" mysql-proxy.cnf
chmod -v 0400 mysql-proxy.cnf
chown root:root -v mysql-proxy.cnf
mv -vf mysql-proxy.cnf /etc/mysql/

echo "rm -f /var/run/mysqld/mysqld.sock" >> /etc/default/mysql-proxy
echo "mkdir -p /var/run/mysqld" >> /etc/default/mysql-proxy
cat /etc/default/mysql-proxy

service mysql-proxy start
service mysql-proxy stop
service mysql-proxy start
