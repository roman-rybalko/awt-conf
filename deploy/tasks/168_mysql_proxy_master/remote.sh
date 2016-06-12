#!/bin/sh -ex
. ./remote.conf

sed -i "s/MYSQL_PROXY_PORT/$MYSQL_PROXY_PORT/" mysql-proxy.cnf
chmod -v 0400 mysql-proxy.cnf
chown root:root -v mysql-proxy.cnf
mv -vf mysql-proxy.cnf /etc/mysql/

service mysql-proxy start
service mysql-proxy stop
service mysql-proxy start

MYSQL_RPXOY_SLAVE4=`cat mysql_proxy_slave4`
[ -n "$MYSQL_RPXOY_SLAVE4" ]

iptables -A INPUT -p tcp --dport $MYSQL_PROXY_PORT '!' -i lo '!' -s $MYSQL_RPXOY_SLAVE4 -j REJECT --reject-with tcp-reset
