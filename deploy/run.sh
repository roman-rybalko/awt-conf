#!/bin/sh -ex

tasklist=$1
hostpath=$2

[ -n "$tasklist" ]
[ -d $tasklist ]
for t in $tasklist/*
do
	[ -d $t ]
	[ -x $t/local.sh ]
	[ -x $t/remote.sh ]
done

[ -n "$hostpath" ]
[ -f $hostpath ]
[ ! -e $hostpath.ok ]
[ ! -e $hostpath.fail ]
[ ! -e $hostpath.log ]

tasks="`for t in $tasklist/*; do basename $t; done | sort`"
host=`basename $hostpath`
localworkdir="`pwd`"

>$hostpath.log
localtaskdir=`mktemp -d /tmp/deploy-$host-XXX`
for t in $tasks
do
	cd "$localworkdir"
	cp -RL $tasklist/$t $localtaskdir/
	cd $localtaskdir/$t
	echo "LOCAL TASK: $t"
	if ./local.sh $host 2>&1 # errors to the host log
	then
		echo "LOCAL RESULT: $t: OK"
	else
		result=$?
		echo "LOCAL RESULT: $t: FAIL ($result)"
		cd "$localworkdir"
		mv $hostpath.log $hostpath.fail
		rm -R $localtaskdir
		exit $result
	fi
done >>"$localworkdir/$hostpath.log" # errors to the general log
cd "$localworkdir"

if [ -e $hostpath.pw ]
then
	[ -f $hostpath.pw ]
	sshuser=root
	sshprefix="./sshpass.sh $hostpath.pw"
	sshopt1="-o StrictHostKeyChecking=no"
elif [ -e deploy.key ]
then
	[ -f deploy.key ]
	sshuser=deploy
	sshopt="-o BatchMode=yes"
	ssh-add deploy.key
elif [ -e deploy.keytab ]
then
	[ -f deploy.keytab ]
	sshuser=deploy
	sshopt="-o BatchMode=yes"
	KRB5CCNAME=FILE:$localtaskdir/.krb5cc
	export KRB5CCNAME
	kinit -t deploy.keytab deploy
else
	echo "deploy auth info is not found"
	exit 1
fi

remotetaskdir=`$sshprefix ssh $sshopt1 $sshopt $sshuser@$host mktemp -d /tmp/deploy-XXX | tr -d '[[:space:]]'`
if [ -z "$remotetaskdir" ]
then
	echo "ssh failed" >>$hostpath.log
	mv $hostpath.log $hostpath.fail
	rm -Rf $localtaskdir
	exit 1
fi
[ ${#remotetaskdir} -eq 15 ]
$sshprefix ssh $sshopt -tt $sshuser@$host test -d $remotetaskdir
$sshprefix scp $sshopt -r $localtaskdir/* remoterun.sh $sshuser@$host:$remotetaskdir
# errors to stdout, then to host log (see remoterun.sh)
$sshprefix ssh $sshopt -tt $sshuser@$host $remotetaskdir/remoterun.sh $tasks >>$hostpath.log && mv $hostpath.log $hostpath.ok || mv $hostpath.log $hostpath.fail
$sshprefix ssh $sshopt -tt $sshuser@$host rm -Rf $remotetaskdir
rm -Rf $localtaskdir
