#!/bin/bash

WORKDIR=$(dirname $(readlink -f "$0"))
cd $WORKDIR

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# wget https://raw.githubusercontent.com/CDQhub/CDQSync/master/conf/vimrc
# mv vimrc ~/.vim/vimrc
cp ../conf/vimrc ~/.vim/vimrc

cd -

vim +plugInstall
