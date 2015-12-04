#!/bin/sh -e

if [ `id -u` = 0 ]
then
	tasknote=" (root)"
else
	taskprefix="sudo"
fi

cd "`dirname $0`"
workdir="`pwd`"
while [ -n "$1" ]
do
	task=$1
	shift
	cd "$workdir/$task"
	echo "REMOTE TASK: $task$tasknote"
	if $taskprefix ./remote.sh </dev/null 2>&1 # errors to the host log
	then
		echo "REMOTE RESULT: $task: OK"
	else
		result=$?
		echo "REMOTE RESULT: $task: FAIL ($result)"
		exit $result
	fi
done
