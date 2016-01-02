#!/bin/sh -ex
. ./framework.sh
export IP4=92.63.99.29
export IP6=2a01:230:2:6::35b
deploy_batch 500_failover_iptables 231_awt_cron_del
