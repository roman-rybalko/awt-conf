h=XX.hosts.advancedwebtesting.net
echo $h > /etc/hostname
hostname $h

service postfix restart || true
service squid3 restart || true
service munin-node restart || true
