#!/bin/sh -ex
. ./framework.sh
export MYSQL_SLAVE4=85.143.220.253
DEPLOY_BATCH_REORDER="080_iptables 999_iptables"
deploy_batch 166_mysql_proxy 167_mysql_proxy_master 167_mysql_iptables_master
