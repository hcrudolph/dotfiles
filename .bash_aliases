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

# dnf
alias dnfc='dnf clean all'
alias dnfi='dnf install'
alias dnfr='dnf remove'
alias dnfs='dnf search'
alias dnfu='dnf update'

# git
alias gaa='git add -A'
alias gad='git add'
alias gbr='git branch'
alias gci='git commit'
alias gco='git checkout'
alias gdf='git diff'
alias github=Github
alias glo='git log'
alias gpl='git pull'
alias gpu='git push'
alias grb='git rebase'
alias gst='git status'
alias gus='git reset HEAD'

urlunquote() {
    python3 -c "import urllib.parse; print(urllib.parse.unquote('$1', safe=''))"
}

whereru() {
    curl -s https://api.ipgeolocationapi.com/geolocate/$1
}

Gitlab() {
    if [ ! -d .git ] ; 
        then echo "ERROR: This isnt a git directory" && return false; 
    fi
    git_url=`git config --get remote.origin.url`
    if [[ $git_url != https://git.hcrudolph.com* ]] ;
        then echo "ERROR: Remote origin is invalid" && return false;
    fi
    url=${git_url%.git}
    firefox $url
}
