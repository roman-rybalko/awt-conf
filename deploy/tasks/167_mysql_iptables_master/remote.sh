#!/bin/sh -ex
. ./remote.conf

MYSQL_SLAVE4=`cat mysql_slave4`
[ -n "$MYSQL_SLAVE4" ]

iptables -A INPUT -p tcp --dport $MYSQL_PROXY_PORT '!' -i lo '!' -s $MYSQL_SLAVE4 -j REJECT --reject-with tcp-reset
