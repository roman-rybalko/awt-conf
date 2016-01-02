#!/bin/sh -ex
. ./framework.sh
export IP4=92.63.99.29
export IP6=2a01:230:2:6::35b
export ADD=0
deploy_batch 500_failover_iptables 236_awt_cron
