#!/bin/bash

WORKDIR=$(dirname $(readlink -f "$0"))
cd $WORKDIR

echo "**********************"
./bin/sync_bashrc.sh
echo "finish sync bashrc!"
echo "**********************"
./bin/sync_zshrc.sh
echo "finish sync zshrc!"
echo "**********************"
./bin/sync_vimrc.sh
echo "finish sync vimrc!"
echo "**********************"

cd -
