#!/bin/bash

WORKDIR=$(dirname $(readlink -f "$0"))
cd $WORKDIR

if [ ! -f ~/.vim/autoload/plug.vim ];then
    echo "plug.vim is not exists, then will install plug.vim first" 1>&2
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    # wget https://raw.githubusercontent.com/CDQhub/CDQSync/master/conf/vimrc
    echo "install plug.vim successfully." >&2
fi
if [ ! -d ~/.vim/undo ];then
    echo "create undo dir... path: ~/.vim/undo" >&2
    mkdir ~/.vim/undo
fi
# mv vimrc ~/.vim/vimrc
echo "cp my vimrc to ~/.vim/vimrc" 1>&2
cp ../conf/vimrc ~/.vim/vimrc

cd -
