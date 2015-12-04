#!/bin/sh -ex

tasklist=$1
hostlist=$2
taskcnt=10

[ -n "$tasklist" ]
[ -d $tasklist ]
for t in $tasklist/*
do
	[ -d $t ]
	[ -x $t/local.sh ]
	[ -x $t/remote.sh ]
done

[ -n "$hostlist" ]
[ -d $hostlist ]

for h in $hostlist/*
do
	[ -f $h ]
	[ ! -e $h.ok ]
	[ ! -e $h.fail ]
	[ ! -e $h.log ]
done

hosts="`for h in $hostlist/*; do basename $h .pw; done | sort -u`"
./sched.sh "./run.sh $tasklist" $taskcnt `for h in $hosts; do echo $hostlist/$h; done`
echo $hostlist/*.fail
