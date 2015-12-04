#!/bin/sh -e

cmd="$1"
shift
count=$1
shift

[ -n "$cmd" ]
[ -n "$count" ]
[ $count -gt 0 ]
[ -n "$1" ]

jobf=`mktemp /tmp/sched-XXX`

getjob()
{
	i=1
	while [ $i -le $count ]
	do
		if [ -e $jobf-$i ]
		then
			i=$(( $i + 1 ))
		else
			touch $jobf-$i
			echo $jobf-$i
			break
		fi
	done
}

newjob()
{
	$cmd $2 || true
	rm -f $1
}

start()
{
	j=`getjob`
	while [ -z "$j" ]
	do
		sleep 1
		j=`getjob`
	done
	newjob $j $1 &
}

while [ -n "$1" ]
do
	start $1
	shift
done

wait
rm -f $jobf
