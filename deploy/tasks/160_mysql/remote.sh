#!/bin/sh -ex
. ./remote.conf

mv -vf *.cnf /etc/mysql/conf.d/
chown -v root:root /etc/mysql/conf.d/*.cnf
chmod -v 0444 /etc/mysql/conf.d/*.cnf

service mysql restart

mysql --user=root --password=`cat pw` --batch < db.sql
mysql --user=root --password=`cat pw` --batch < users.sql
for f in master*.sql; do
	[ ! -f $f ] || mysql --user=root --password=`cat pw` --batch < $f
done
