#!/bin/zsh
#####
## @Author      : caodaqian
## @since       : 2020-09-09 10:45:58
## @LastEditors : caodaqian
## @lastTime    : 2020-09-09 13:57:42
## @Description : sync zshrc and mkdir user tmp dir
######

set -e
WORKDIR=$(dirname $(dirname $(readlink -f "$0")))

if [ ! -x /usr/bin/zsh ]; then
    echo "Can't find zsh, then will install zsh firstly" >&2
    sudo yum install zsh -y
fi

if [ ! -d ~/.oh-my-zsh ]; then
    echo "Can't find .oh-my-zsh, then will install oh-my-zsh" >&2
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [[ -d ${HOME}/.oh-my-zsh ]]; then
    echo "install zsh plugins"
    # install autosuggestions and syntax_highlignt
    [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ] && git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

if [[ ! -f ${HOME}/.zshrc ]]; then
    # get zshrc
    echo "cp my zshrc to ~/.zshrc" >&2
    cp ${WORKDIR}/zsh/zshrc ${HOME}/.zshrc
fi

[ ! -d ${HOME}/.config ] && mkdir ${HOME}/.config
echo "cp my config file to ~/.config" >&2
cp -f ${WORKDIR}/config/*.conf ${HOME}/.config

## for env settings
[ ! -d ${HOME}/Software ] && mkdir ${HOME}/Software
[ ! -d ${GOTMPDIR} ] && mkdir -p ${GOTMPDIR}
[ ! -d ${TMUX_TMPDIR} ] && mkdir -p ${TMUX_TMPDIR}

source ${HOME}/.zshrc
