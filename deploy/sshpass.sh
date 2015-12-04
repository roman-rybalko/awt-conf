#!/bin/sh -e

passfile=$1
[ -n "$passfile" ]
[ -f $passfile ]
pass="`cat $passfile`"
shift
exec expect -c "log_user 0 ; set timeout 60 ;\
 spawn $* ;\
 expect assword ;\
 send \"$pass\\n\" ;\
 log_user 1 ;\
 expect timeout { exit 1 } eof ;\
 catch wait result ;\
 exit [lindex \$result 3]"
