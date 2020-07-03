#!/bin/sh

set -x

cd ~
# install tmux
yum -y install libevent-devel
git clone https://github.com/tmux/tmux.git
sh tmux/autogen.sh
./tmux/configure && make

# install oh-my-tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

cd -
