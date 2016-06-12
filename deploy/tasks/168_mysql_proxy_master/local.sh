#!/bin/sh -ex
. ./local.conf

[ -n "$MYSQL_PROXY_SLAVE4" ]
echo "$MYSQL_PROXY_SLAVE4" > mysql_proxy_slave4
grep '\.' mysql_proxy_slave4 # IPv4 only
