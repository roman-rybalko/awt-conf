#! /bin/sh

set -x
set -e

apt-get --purge --yes remove sasl2-bin xinetd bind9 cups \
	libsnmp-base libsnmp15 snmp \
	sendmail sendmail-base sendmail-bin sendmail-cf sendmail-doc \
	nfs-common rpcbind \
	samba samba-common \
	apache2 apache2-doc apache2-mpm-prefork apache2.2-bin apache2.2-common apache2-utils \
	|| true

sed -i '/exit/ d' /etc/rc.local
cat rc.sh >> /etc/rc.local

apt-key add wheezy.keys
apt-get update
apt-get --purge --yes dist-upgrade
apt-get --purge --yes install patch mc screen bash-completion sudo

patch -b /etc/ssh/sshd_config < sshd_config.diff

apt-get --purge --yes install postfix
cat aliases >> /etc/aliases
newaliases

apt-get --purge --yes install logwatch
