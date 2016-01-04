#!/bin/sh -ex
. ./framework.sh
export SWAP_SIZE=2048
deploy_batch 025_swap
