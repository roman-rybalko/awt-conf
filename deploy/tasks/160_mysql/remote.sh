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

apt-get --yes --purge install libcache-cache-perl
chmod -v 0440 mysql
chown -v root:munin mysql
mv -vf mysql /etc/munin/plugin-conf.d/
for f in \
bin_relay_log \
commands \
connections \
files_tables \
innodb_bpool \
innodb_bpool_act \
innodb_io \
innodb_log \
innodb_rows \
innodb_semaphores \
innodb_tnx \
myisam_indexes \
network_traffic \
qcache \
qcache_mem \
replication \
select_types \
slow \
sorts \
table_locks \
tmp_tables \
; do
	ln -svf /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_${f}
done
service munin-node restart
