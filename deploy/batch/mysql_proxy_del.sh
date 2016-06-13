#!/bin/sh -ex
. ./framework.sh

# master <-> middle <-> slave
export MYSQL_MASTER4=85.143.220.71 # master
export MYSQL_MASTER6=2a04:ac00:1:5bbc:5054:ff:fe00:7e65 # master
export MYSQL_SLAVE4=85.143.220.253 # middle
export MYSQL_SLAVE6=2a04:ac00:1:4f91:5054:ff:fe00:6601 # slave

DEPLOY_BATCH_REORDER="080_iptables 999_iptables"
deploy_batch 165_mysql_proxy_del
