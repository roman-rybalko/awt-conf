#! /bin/sh -e

#U=awt-bak
#P=9z4NC5cUD68XM7EYHrgKjF
B=drop.sql
U=awt
P=awt
DB=awt

mysqldump --compress --single-transaction --quick --compact \
	--no-create-db \
	--add-drop-table \
	--no-data \
	--user=$U --password=$P \
	$DB | grep -i 'DROP TABLE' > $B

chmod 0440 $B
