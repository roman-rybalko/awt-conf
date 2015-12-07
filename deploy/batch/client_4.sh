#!/bin/sh -ex
. ./framework.sh
export CLIENT_N=4
#export LOCK_N=4
#export LOCK_N=2
deploy_batch 320_client_n
