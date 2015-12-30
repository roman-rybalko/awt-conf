#!/bin/sh -ex
. ./remote.conf

chmod -v a-w,og-rx awt-www-repl.*
mv -vf awt-www-repl.* /root/
chown -v root:root /root/awt-www-repl.*

crontab -l | grep -v awt-www-repl > ct || true
grep PATH ct || echo 'PATH=/bin:/sbin:/usr/bin:/usr/sbin' >> ct
echo '* * * * * /root/awt-www-repl.sh' >> ct
cat ct
crontab ct
