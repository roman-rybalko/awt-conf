#!/bin/sh -ex
. ./local.conf

[ -n "$MYSQL_MASTER4" ]
echo "$MYSQL_MASTER4" > mysql_master4
grep '\.' mysql_master4 # IPv4 only
