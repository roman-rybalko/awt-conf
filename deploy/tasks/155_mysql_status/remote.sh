#!/bin/sh -ex
. ./remote.conf

mysql --user=`cat u` --password=`cat p` --batch -e status
mysql --user=`cat u` --password=`cat p` --batch -e 'SHOW PROCESSLIST\G'
mysql --user=`cat u` --password=`cat p` --batch -e 'SHOW master STATUS\G'
mysql --user=`cat u` --password=`cat p` --batch -e 'SHOW SLAVE STATUS\G'
#mysql --user=`cat u` --password=`cat p` --batch -e 'SHOW SLAVE HOSTS\G'
