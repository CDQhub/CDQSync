#!/bin/bash

WORKDIR=$(dirname $(readlink -f "$0"))
cd $WORKDIR

# sync bashrc
echo "**********************" >&2
./bin/sync_bashrc.sh
echo "finish sync bashrc!" >&2
echo "**********************" >&2
# sync vimrc
./bin/sync_vimrc.sh
echo "finish sync vimrc!" >&2
echo "**********************" >&2
# sync zshrc
./bin/sync_zshrc.sh
echo "finish sync zshrc!" >&2
echo "**********************" >&2
# sync tmux
./bin/sync_tmux.sh
echo "finish sync tmux!" >&2
echo "**********************" >&2

cd -
