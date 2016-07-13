#!/bin/bash

# General
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias h='head'
alias t='tail'
alias tm='tmux'
alias py3='python3'
alias py='python'
alias v='vim'
alias reload='. ~/.bashrc'
alias gtime='/usr/bin/time'
alias ..='cd ..'
alias ...='cd ../..'

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
alias gad='git add'
alias gaa='git add -A'
alias gus='git reset HEAD'
alias gbr='git branch'
alias gci='git commit'
alias gco='git checkout'
alias gdf='git diff'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
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

