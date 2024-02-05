# Used as base config:
# https://github.com/MrElendig/dotfiles-alice/blob/master/.zshrc

#------------------------------------------------------------------#
# File:     .zshrc   ZSH resource file                             #
# Version:  0.1.16                                                 #
# Author:   Øyvind "Mr.Elendig" Heggstad <mrelendig@har-ikkje.net> #
#------------------------------------------------------------------#

#------------------------------
# Aliases
#------------------------------
alias tree="eza -T --sort type --git-ignore"
alias ls="eza --sort type"
alias ll="eza -lh --sort type"
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

#------------------------------
# History stuff
#------------------------------
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=1000
SAVEHIST=1000

#------------------------------
# Keybindings
#------------------------------
bindkey -e
typeset -g -A key
bindkey '^[k' up-line-or-history
bindkey '^[j' down-line-or-history

# C-w like bash
zle -N backward-kill-bash-word
backward-kill-bash-word() WORDCHARS="" zle .backward-kill-word
bindkey "^W" backward-kill-bash-word

#------------------------------
# Comp stuff
#------------------------------
zmodload zsh/complist 
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
zstyle :compinstall filename '${HOME}/.zshrc'
compdef dotfiles=git

#- buggy
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
#-/buggy

zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

#-----------------------------
# Dircolors
#-----------------------------
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

#------------------------------
# ShellFuncs
#------------------------------
# -- coloured manuals
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

#------------------------------
# Prompt
#------------------------------
autoload -U colors zsh/terminfo
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-staged-changes true
zstyle ':vcs_info:git*' formats '%F{green}[%b]%f'

function check_git_status() {
    git_status=$(git status --porcelain 2> /dev/null | tail -n1)
    git_star=""
    if [[ -n $git_status ]]; then
        git_star="%F{red}*%f"
    fi
    echo $git_star
}

function precmd() { vcs_info }
setopt prompt_subst

PROMPT='$(check_git_status)${vcs_info_msg_0_}%F{cyan}[%~]%f%(!.#.$) '
