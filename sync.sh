#!/bin/bash

WORKDIR=$(dirname $(readlink -f "$0"))
cd $WORKDIR

# sync bashrc
echo "**********************"
./bin/sync_bashrc.sh
echo "finish sync bashrc!"
echo "**********************"
# sync vimrc
./bin/sync_vimrc.sh
echo "finish sync vimrc!"
echo "**********************"
# sync zshrc
./bin/sync_zshrc.sh
echo "finish sync zshrc!"
echo "**********************"

cd -
