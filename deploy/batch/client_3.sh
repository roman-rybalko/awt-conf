#!/bin/sh -ex
. ./framework.sh
export CLIENT_N=3
#export LOCK_N=3
deploy_batch 320_client_n
