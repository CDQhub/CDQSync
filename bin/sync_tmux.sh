#!/bin/sh

set -e
WORKDIR=$(dirname $(dirname $(readlink -f "$0")))

# install tmux
if [ -z $(rpm -qa | grep libevent-develd) ];then
    echo "check not install libevent, then will install libevent firstly"
    yum -y install libevent-devel
fi

if [ -z $(tmux --version 2>/dev/null) ];then
    echo "check not install tmux, then will install tmux secondly"
    git clone https://github.com/tmux/tmux.git
    sh tmux/autogen.sh
    ./tmux/configure && make && sudo make install
    rm -rf ./tmux
fi

if [ ! -d ${HOME}/.tmux ]; then
    echo "install oh-my-tmux" >&2
    git clone https://github.com/gpakosz/.tmux.git ${HOME}/
    ln -s -f ${HOME}/.tmux/.tmux.conf ${HOME}/.tmux.conf
    cp ${WORKDIR}/tmux/tmux.conf.local ${HOME}/.tmux.conf.local
fi
