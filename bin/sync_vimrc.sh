#!/bin/bash

cd ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
wget https://raw.githubusercontent.com/CDQhub/CDQSync/master/conf/vimrc
mv vimrc ~/.vim/vimrc
vim +PluginInstall 
cd -
