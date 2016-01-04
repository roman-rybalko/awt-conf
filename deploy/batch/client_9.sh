#!/bin/sh -ex
. ./framework.sh
export CLIENT_N=9
#export LOCK_N=7
#export LOCK_N=1
deploy_batch 320_client_n
