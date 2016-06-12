#!/bin/sh -ex
. ./remote.conf

MYSQL_MASTER4=`cat mysql_master4`
[ -n "$MYSQL_MASTER4" ]

sed -i "s/MYSQL_MASTER/$MYSQL_MASTER4/" mysql-proxy.cnf
sed -i "s/MYSQL_PROXY_PORT/$MYSQL_PROXY_PORT/" mysql-proxy.cnf
chmod -v 0400 mysql-proxy.cnf
chown root:root -v mysql-proxy.cnf
mv -vf mysql-proxy.cnf /etc/mysql/

service mysql-proxy start
service mysql-proxy stop
service mysql-proxy start

MYSQL_MASTER6=`cat mysql_master6`
[ -n "$MYSQL_MASTER6" ]
MYSQL_SLAVE6=`cat mysql_slave6`
[ -n "$MYSQL_SLAVE6" ]

ip6tables -t nat -A PREROUTING -p tcp --dport $MYSQL_PORT -s $MYSQL_SLAVE6 -m addrtype --dst-type LOCAL -j DNAT --to-destination "[$MYSQL_MASTER6]:$MYSQL_PORT"
ip6tables -t nat -A POSTROUTING -p tcp --dport $MYSQL_PORT -s $MYSQL_SLAVE6 -d $MYSQL_MASTER6 -j MASQUERADE

sysctl -p 50-mysql-ipv6-forwarding.conf
chown -v root:root 50-mysql-ipv6-forwarding.conf
chmod 0440 -v 50-mysql-ipv6-forwarding.conf
mv -vf 50-mysql-ipv6-forwarding.conf /etc/sysctl.d/
