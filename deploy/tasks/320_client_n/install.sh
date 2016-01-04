#! /bin/sh

set -e
set -x

N=`cat client_n`

[ -n "$N" ]
[ -e /etc/init.d/awt-client ]
[ ! -e /home/client$N ]

wget http://deploy/client/home.tgz -O - | tar -xz

cd home
chown -R root:root .
chmod -R a+rX,a-ws .

H=`hostname -s`
useradd -m -U client$N
chfn --full-name "AWT Client #$N on $H" client$N
chmod 0700 /home/client$N

mv -f * .??* /home/client$N/

echo root > /home/client$N/.forward
chown -v client$N:client$N /home/client$N/.forward
chmod -v a-w,og-rx /home/client$N/.forward

crontab -l | grep -v /root/watchdog.sh > ct || true
grep PATH ct || echo 'PATH=/bin:/sbin:/usr/bin:/usr/sbin' >> ct
echo '*/10 * * * * /root/watchdog.sh 10 /home/client*/config.sh' >> ct
crontab ct
rm -vf ct

service awt-client status || true
service awt-client restart
service awt-client status
