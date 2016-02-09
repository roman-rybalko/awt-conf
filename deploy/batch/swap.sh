#!/bin/sh -ex
. ./framework.sh
export SWAP_SIZE=1024
deploy_batch 025_swap
