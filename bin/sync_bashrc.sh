#!/bin/bash

cd ~

# get Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim

# get bashrc
wget https://raw.githubusercontent.com/CDQhub/CDQSync/master/conf/bashrc
mv bashrc .bashrc
source .bashrc
cd -
