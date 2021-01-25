#!/bin/bash

# General
alias ..="cd .."
alias d="docker"
alias dc="docker-compose"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias grep="grep --color=auto"
alias gtime="/usr/bin/time"
alias la="ls -la"
alias ll="ls -l"
alias ls="ls -G"
alias py3="python3"
alias py="python"
alias reload=". ~/.zshrc"
alias h="head"
alias t="tail"
alias v="vim"
alias prettyjson="python3 -m json.tool"
alias env=". venv/bin/activate"
alias k="kubectl"


# Git
alias gad="git add"
alias gaa="git add -A"
alias gus="git reset HEAD"
alias gbr="git branch"
alias gci="git commit"
alias gco="git checkout"
alias gdf="git diff"
alias gpl="git pull"
alias gpu="git push"
alias grb="git rebase"
alias gst="git status"

# Macros
longpls() {
    curl -s --head $1 | grep location | awk '{ print $2 }'
}

dtoi() {
    dscacheutil -q host -a name $1 | grep ip_address | awk '{ print $2 }'
}

utod() {
    echo $1 | awk -F/ '{ print $3 }'
}

urlquote() {
    python3 -c "import urllib.parse; print(urllib.parse.quote('$1', safe=''))"
}

urlunquote() {
    python3 -c "import urllib.parse; print(urllib.parse.unquote('$1', safe=''))"
}

showonmap() {
    /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome "https://www.google.com/maps?q=$1,$2"
}

whereru() {
    curl -s https://api.ipgeolocationapi.com/geolocate/$1
}
