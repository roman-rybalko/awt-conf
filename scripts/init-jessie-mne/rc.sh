h=XX.hosts.advancedwebtesting.net
echo $h > /etc/hostname
hostname $h

umount -f /tmp || true

service postfix restart || true
service squid3 restart || true
