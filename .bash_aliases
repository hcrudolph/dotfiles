#!/bin/bash

# General
alias ..='cd ..'
alias d='docker'
alias dc='docker-compose'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias gtime='/usr/bin/time'
alias h='head'
alias la='ls -la'
alias ll='ls -l'
alias ls='ls --color=auto'
alias py3='python3'
alias py='python'
alias reload='. ~/.bashrc'
alias t='tail'
alias tm='tmux'
alias v='vim'

# aptitude
alias apt-clean='sudo apt-get clean'
alias apt-install='sudo apt-get install'
alias apt-policy="LANG=C apt-cache policy"
alias apt-purge='sudo apt-get --purge  remove'
alias apt-remove='sudo apt-get remove'
alias apt-search='apt-cache search'
alias apt-show='apt-cache show'
alias apt-up="sudo apt-get update && sudo apt-get upgrade"

# dnf
alias dnfs='dnf search'
alias dnfi='dnf install'
alias dnfu='dnf update'
alias dnfc='dnf clean all'
alias dnfr='dnf remove'

# git
alias github=Github
alias gad='git add'
alias gaa='git add -A'
alias gus='git reset HEAD'
alias gbr='git branch'
alias gci='git commit'
alias gco='git checkout'
alias gdf='git diff'
alias gpl='git pull'
alias gpu='git push'
alias grb='git rebase'
alias gst='git status'

cdl() {
    builtin cd "$*"
    RESULT=$?
    if [ "$RESULT" -eq 0 ]; then
        ll
    fi
}

mcd () {
    mkdir $1 && cd $1
}

Github() {
    if [ ! -d .git ] ; 
        then echo "ERROR: This isnt a git directory" && return false; 
    fi
    git_url=`git config --get remote.origin.url`
    if [[ $git_url != https://github* ]] ;
        then echo "ERROR: Remote origin is invalid" && return false;
    fi
    url=${git_url%.git}
    firefox $url
}
