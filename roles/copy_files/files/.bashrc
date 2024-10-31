#
# ~/.bashrc
#
# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias v='vim'
alias vi='vim'

alias ls='ls --color'
alias ll='ls -l'
alias grep='grep --color=auto'
alias s='sudo'
alias dodo='sudo shutdown now'
alias k='kubectl'
export do="--dry-run=client -o yaml"
redshift -P -O 2400
###############################################################################
# Colours

# Generated using https://dom111.github.io/grep-colors
GREP_COLORS='sl=49;39:cx=49;39:mt=49;31;1:fn=49;32:ln=49;33:bn=49;33:se=1;36'
#GREP_OPTIONS='--color=auto' # Deprecated

# Generated by hand, referencing http://linux-sxs.org/housekeeping/lscolors.html
# and https://geoff.greer.fm/lscolors/
LS_COLORS='di=1;32:ln=1;30;47:so=30;45:pi=30;45:ex=1;31:bd=30;46:cd=30;46:su=30'
LS_COLORS="${LS_COLORS};41:sg=30;41:tw=30;41:ow=30;41:*.rpm=1;31:*.deb=1;31"
LSCOLORS=CxahafafBxagagabababab

export GREP_COLORS LS_COLORS LSCOLORS

export PS1="\[$(tput setaf 196)\]\u\[$(tput setaf 202)\]@\[$(tput setaf 208)\]\h\[$(tput setaf 220)\]\w\[$(tput sgr0)\]\$(parse_git_branch)\[\033[00m\]$ "
export PATH=$PATH:/usr/local/go/bin