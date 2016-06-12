#!/bin/sh -ex
. ./local.conf

[ -n "$MYSQL_MASTER6" ]
[ -n "$MYSQL_SLAVE6" ]
echo "$MYSQL_MASTER6" > mysql_master6
echo "$MYSQL_SLAVE6" > mysql_slave6
grep ':' mysql_master6 # IPv6 only
grep ':' mysql_slave6 # IPv6 only

[ -n "$MYSQL_PROXY_SLAVE4" ]
echo "$MYSQL_PROXY_SLAVE4" > mysql_proxy_slave4
grep '\.' mysql_proxy_slave4 # IPv4 only
