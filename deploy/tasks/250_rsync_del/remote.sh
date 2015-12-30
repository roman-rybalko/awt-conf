#!/bin/sh -ex
. ./remote.conf

apt-get --yes --purge remove rsync
apt-get --yes --purge autoremove
