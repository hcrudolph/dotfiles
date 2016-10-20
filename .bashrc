# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

__DEFAULT_COLOR="[90m"
__WHITE_COLOR="[97m"
__PINK_COLOR="[35m"
__GREEN_COLOR="[92m"
__YELLOW_COLOR="[93m"
__ORANGE_COLOR="[33m"
__RED_COLOR="[91m"
__CYAN_COLOR="[36m"


# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command
shopt -s checkwinsize

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
    else
    color_prompt=
    fi
fi

# Import custom aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# disable graphical password dialog
[ -n "$SSH_CONNECTION" ] && unset SSH_ASKPASS

# PS1 Promt
PS1_USER="\[\e${__GREEN_COLOR}\]\u\[\e[m\]"
PS1_FQDN="\[\e${__YELLOW_COLOR}\]\H\[\e[m\]"
PS1_DIR="\[\e${__RED_COLOR}\]\w\[\e[m\]"
PS1_BRANCH="\[\e${__CYAN_COLOR}\]\$git_branch\[\e[m\]"
PS1_DIRTY="\[\e${__CYAN_COLOR}\]\$git_dirty\[\e[m\]"

export PS1="\[\e${__DEFAULT_COLOR}\]$PS1_USER at $PS1_FQDN in $PS1_DIR $PS1_BRANCH $PS1_DIRTY\[\e[m\]
$ "

# TexLive 2016
PATH="/usr/local/texlive/2016/bin/x86_64-linux/:$PATH"
# Excercism
PATH="/opt/exercism/:$PATH"
# RVM
PATH="~/.rvm/bin:$PATH" # Add RVM to PATH for scripting

# Exports
export GITAWAREPROMPT=~/git/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

export GIT_ASKPASS=
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH
export EDITOR="vim"
