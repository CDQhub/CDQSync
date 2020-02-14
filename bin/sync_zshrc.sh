#!/bin/bash

WORKDIR=$(dirname $(readlink -f "$0"))
cd $WORKDIR

# install autosuggestions and syntax_highlignt
git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# get zshrc
# wget https://raw.githubusercontent.com/CDQhub/CDQSync/master/conf/zshrc
# mv zshrc .zshrc
cp ../conf/zshrc ~/.zshrc

cd -
source ~/.zshrc
