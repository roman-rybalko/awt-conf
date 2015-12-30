#!/bin/sh -ex
. ./remote.conf

apt-get update
apt-get --yes --purge install php5-cli php5-json php5-mysql php5-xsl php5-gd php5-curl php-pear
