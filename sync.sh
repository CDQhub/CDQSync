#!/bin/bash

./bin/sync_bashrc.sh
echo "finish sync bashrc!"
./bin/sync_zshrc.sh
echo "finish sync zshrc!"
./bin/sync_vimrc.sh
echo "finish sync vimrc!"
