#!/bin/sh -ex
. ./mysql_proxy.conf
. ./framework.sh
DEPLOY_BATCH_REORDER="080_iptables 999_iptables"
deploy_batch 165_mysql_proxy_del 166_mysql_proxy 168_mysql_proxy_master
