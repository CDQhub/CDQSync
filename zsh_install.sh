#!/bin/bash
set -xe

cd ~
# install zsh
sudo yum install zsh
chsh -s /bin/zsh
# install oh-my-zsh
https://github.com/robbyrussell/oh-my-zsh sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-myzsh/master/tools/install.sh -O -)"
# get zshrc
wget https://github.com/CDQhub/CDQSync/raw/master/zshrc
mv zshrc .zshrc
source ~/.zshrc
cd -
