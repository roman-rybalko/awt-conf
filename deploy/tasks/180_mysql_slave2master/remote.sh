#!/bin/sh -ex
. ./remote.conf

mysql --user=`cat u` --password=`cat p` --batch -e 'stop slave'
mysql --user=`cat u` --password=`cat p` --batch -e 'reset slave'
mysql --user=`cat u` --password=`cat p` --batch -e 'reset master'
/root/awt-db-backup.sh
