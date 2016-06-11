#!/bin/sh -ex
. ./framework.sh
export IP4=85.143.220.253
export IP6=2a04:ac00:1:655f:5054:ff:fe00:91ab
deploy_batch 500_failover_iptables 231_awt_cron_del
