#!/bin/bash

cd ~
wget https://raw.githubusercontent.com/CDQhub/CDQSync/master/conf/vimrc
mv vimrc ~/.vimrc
vim +PluginInstall 
