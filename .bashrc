case $- in
    *i*) ;;
      *) return;;
esac

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# WSL specefic
alias explore='explorer.exe .'

# Python
alias venv='python3 -m venv .venv && source .venv/bin/activate'
## See https://github.com/github/gitignore/ for more .gitignore's
alias gitignore-python='curl -s https://raw.githubusercontent.com/github/gitignore/main/Python.gitignore > .gitignore'

# Git Aliases
alias cls='clear'

# Basic Git commands
alias gs='git status'
alias ga='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gd='git diff'
alias gl='git log'
alias glo='git log --oneline'

# Branch operations
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gm='git merge'

# Remote operations
alias gf='git fetch'
alias gr='git remote'
alias grv='git remote -v'
# Stash operations

alias gst='git stash'
alias gstp='git stash pop'
# More advanced but useful

alias glog='git log --graph --oneline --all'
alias glast='git log -1 HEAD'
alias gundo='git reset HEAD~1'

if [ -f ~/.githooks ]; then
    . ~/.githooks
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoredups:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=4000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Export the PS1 with the original colors:
# Username@host: Green (\033[32m)
# Directory: Blue (\033[34m)
# Git branch: Red (\033[31m)
export PS1="\[\033[32m\]\u@\h \[\033[34m\]\w\[\033[31m\]\$(parse_git_branch)\[\033[00m\] \$ "
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# Source goto
[[ -s "/usr/local/share/goto.sh" ]] && source /usr/local/share/goto.sh

