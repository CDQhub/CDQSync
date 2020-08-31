#!/bin/sh

set -ex
WORKDIR=$(dirname $(readlink -f "$0"))
cd $WORKDIR

# install tmux
if [ ! -x /usr/lib64/libevent.so ];then
    echo "check not install libevent, then will install libevent firstly"
    yum -y install libevent-devel
fi

if [ ! -x tmux  ];then
    echo "check not install tmux, then will install tmux secondly"
    git clone https://github.com/tmux/tmux.git
    sh tmux/autogen.sh
    ./tmux/configure && make
    sudo make install
    rm -rf ./tmux
fi

# install oh-my-tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp ../conf/tmux.conf.local ~/.tmux.conf.local

mkdir -p ${HOME}/.tmp/tmux_tmp 2>/dev/null

cd -
