#!/bin/sh -ex
. ./remote.conf

apt-get --yes --purge remove mysql-proxy
apt-get --yes --purge autoremove
rm -vf /etc/mysql/mysql-proxy.cnf /etc/default/mysql-proxy

MYSQL_MASTER6=`cat mysql_master6`
[ -n "$MYSQL_MASTER6" ]
MYSQL_SLAVE6=`cat mysql_slave6`
[ -n "$MYSQL_SLAVE6" ]

ip6tables -t nat -D PREROUTING -p tcp --dport $MYSQL_PORT -s $MYSQL_SLAVE6 -m addrtype --dst-type LOCAL -j DNAT --to-destination "[$MYSQL_MASTER6]:$MYSQL_PORT" || true
ip6tables -t nat -D POSTROUTING -p tcp --dport $MYSQL_PORT -s $MYSQL_SLAVE6 -d $MYSQL_MASTER6 -j MASQUERADE || true

rm -vf /etc/sysctl.d/50-mysql-ipv6-forwarding.conf

MYSQL_RPXOY_SLAVE4=`cat mysql_proxy_slave4`
[ -n "$MYSQL_RPXOY_SLAVE4" ]

iptables -D INPUT -p tcp --dport $MYSQL_PROXY_PORT '!' -i lo '!' -s $MYSQL_RPXOY_SLAVE4 -j REJECT --reject-with tcp-reset || true
