#!/bin/sh -ex
. ./framework.sh

# master <-> middle <-> slave
export MYSQL_MASTER4=85.143.220.71 # master
export MYSQL_MASTER6=2a04:ac00:1:5bbc:5054:ff:fe00:7e65 # master
export MYSQL_SLAVE4=92.63.99.29 # middle
export MYSQL_SLAVE6=2a01:230:2:6::35b # slave

DEPLOY_BATCH_REORDER="080_iptables 999_iptables"
deploy_batch 165_mysql_proxy_del
