#!/bin/bash

WORKDIR=$(dirname $(readlink -f "$0"))
cd $WORKDIR

if [ ! -x /usr/bin/zsh ];then
    echo "Can't find zsh, then will install zsh firstly" >&2
    sudo yum install zsh -y
fi

if [ ! -d ~/.oh-my-zsh ];then
    echo "Can't find .oh-my-zsh, then will install oh-my-zsh" >&2
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# install autosuggestions and syntax_highlignt
git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# get zshrc
# wget https://raw.githubusercontent.com/CDQhub/CDQSync/master/conf/zshrc
# mv zshrc .zshrc
echo "cp my zshrc to ~/.zshrc" >&2
cp ../conf/zshrc ~/.zshrc

cd -
source ~/.zshrc
