#!/bin/sh -ex
. ./remote.conf

mysql --user=`cat u` --password=`cat p` --batch -e 'stop slave'
mysql --user=`cat u` --password=`cat p` --batch awt < /tmp/db.sql
mysql --user=`cat u` --password=`cat p` --batch -e 'start slave'
rm -vf /tmp/db.sql
