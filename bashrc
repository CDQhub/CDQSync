# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias cls='clear'
alias la='ls -a'
alias grep='grep --color=auto'
alias gc='git checkout'
alias gpl='git pull'
alias gb='git branch'
alias ga='git add'
alias gp='git push'
alias gcm='git commit'
alias gl='git log'
alias gs='git status'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
