export HITCONTROL=ignoreboth
export LANG=ja_JP.UTF-8
export PS1="[\u \w]\\$"
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
#export PATH=/opt/local/bin:/opt/local/sbin/:~/node_modules/coffee-script/bin:$PATH:/usr/local/bin:
export PATH=~/node_modules/coffee-script/bin:$PATH
export MANPATH=/opt/local/man:$MANPATH
alias ls='ls -Fh'
alias less='less -M'
alias man='env LANG=ja_JP.UTF-8 /usr/local/bin/jman'
alias ll='ls -al'
alias grep='grep --color'
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias view='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -R "$@"'
alias rm='rm -iv'
alias mv='mv -iv'
set -o vi
shopt -s checkwinsize

. /opt/local/etc/bash_completion
