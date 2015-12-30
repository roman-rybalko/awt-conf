#!/bin/sh -ex
. ./local.conf

[ -n "$MYSQL_USER" ]
[ -n "$MYSQL_PASSWORD" ]
echo $MYSQL_USER > u
echo $MYSQL_PASSWORD > p
