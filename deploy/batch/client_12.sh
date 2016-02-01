#!/bin/sh -ex
. ./framework.sh
export CLIENT_N=12
#export LOCK_N=12
deploy_batch 320_client_n
