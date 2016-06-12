#!/bin/sh -ex
. ./local.conf

[ -n "$MYSQL_SLAVE4" ]
echo "$MYSQL_SLAVE4" > mysql_slave4
grep '\.' mysql_slave4 # IPv4 only
