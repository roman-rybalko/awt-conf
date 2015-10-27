#! /bin/sh

cd "`dirname "$0"`"
. config.sh
for p in `pgrep ${NODE_ID}-`; do
	echo -n "$TASK_TYPE: "
	ps -o comm= -p $p
done
