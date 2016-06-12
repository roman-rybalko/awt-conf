#!/bin/sh -ex
. ./framework.sh

#
# DO NOT create a second slave
# single slave only
# MySQL does not handle slaves with a single ID
#

export MYSQL_MASTER4=85.143.220.71
export MYSQL_MASTER6=2a04:ac00:1:5bbc:5054:ff:fe00:7e65
export MYSQL_SLAVE6=2a04:ac00:1:4f91:5054:ff:fe00:6601
DEPLOY_BATCH_REORDER="080_iptables 999_iptables"
deploy_batch 166_mysql_proxy 168_mysql_proxy_slave 168_mysql_iptables_slave
