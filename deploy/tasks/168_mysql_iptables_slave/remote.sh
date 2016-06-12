#!/bin/sh -ex
. ./remote.conf

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
