#! /bin/sh -e

#U=awt-bak
#P=9z4NC5cUD68XM7EYHrgKjF
B=dump.sql
U=awt
P=awt
DB=awt

mysqldump --compress --single-transaction --quick --compact \
	--no-create-db \
	--no-create-info \
	--complete-insert --extended-insert \
	--result-file=$B \
	--user=$U --password=$P \
	$DB

chmod 0440 $B
