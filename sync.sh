#!/bin/bash

WORKDIR=$(dirname $(readlink -f "$0"))
cd $WORKDIR

# sync bashrc
echo "**********************"
./bin/sync_bashrc.sh
echo "finish sync bashrc!"
echo "**********************"
# sync vimrc
./bin/sync_vimrc.sh
echo "finish sync vimrc!"
echo "**********************"
# sync zshrc
while read -p "Do you want to install zsh?" flag
do
    case $flag in
        [Yy][Ee][Ss]|[Yy])
            echo $flag
            # install zsh
            sudo yum install -y zsh
            chsh -s /bin/zsh
            
            # install oh-my-zsh
            #sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
            sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
        ;;
        [Nn][Oo]|[Nn])
            echo "Skip to install zsh."
        ;;
        *)
            echo "input error!(flag=$flag, should be [y/n])"
        ;;
    esac
done
./bin/sync_zshrc.sh
echo "finish sync zshrc!"
echo "**********************"

cd -
