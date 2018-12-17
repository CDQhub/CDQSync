#!/bin/bash

wget https://github.com/CDQhub/CDQSync/raw/master/vimrc
mv vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim 
vim +PluginInstall
