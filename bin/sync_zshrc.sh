#!/bin/bash

cd ~

# install zsh
sudo yum install -y zsh
chsh -s /bin/zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# get zshrc
wget https://raw.githubusercontent.com/CDQhub/CDQSync/master/conf/zshrc
mv zshrc .zshrc
source ~/.zshrc
cd -
