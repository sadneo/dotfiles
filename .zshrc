# Used as base config:
# https://github.com/MrElendig/dotfiles-alice/blob/master/.zshrc

#------------------------------------------------------------------#
# File:     .zshrc   ZSH resource file                             #
# Version:  0.1.16                                                 #
# Author:   Øyvind "Mr.Elendig" Heggstad <mrelendig@har-ikkje.net> #
#------------------------------------------------------------------#

#------------------------------
# Variables
#------------------------------
export PATH="${PATH}:${HOME}/.local/bin:${XDG_CONFIG_DIR}/emacs/bin"
export EDITOR="nvim"
export BROWSER="chromium"
export GTK_THEME="tokyonight"
export QT_QPA_PLATFORM="wayland"

export ANKI_WAYLAND=1
export GOPATH="$HOME/.go"
export KITTY_ENABLE_WAYLAND=1

#------------------------------
# Alias stuff
#------------------------------
alias tree="eza -T --sort type --git-ignore"
alias ls="eza --sort type"
alias ll="eza -lh --sort type"
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias vi="nvim"
alias vim="nvim"

#------------------------------
# History stuff
#------------------------------
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

#------------------------------
# Keybindings
#------------------------------
bindkey -e
typeset -g -A key
bindkey '^?' backward-delete-char
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char 
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# C-w like bash
zle -N backward-kill-bash-word
backward-kill-bash-word() WORDCHARS="" zle .backward-kill-word
bindkey "^W" backward-kill-bash-word

#------------------------------
# Comp stuff
#------------------------------
zmodload zsh/complist 
autoload -Uz compinit
compinit
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
zstyle ':vcs_info:git*' formats "%m%u%c%F{red}[%r/%S]%f%F{yellow}[%b]%f"

setopt PROMPT_SUBST
PROMPT="%F{green}[%n@%m]%f%F{cyan}[%~]%f%(!.#.$) "
RPROMPT=$'${vcs_info_msg_0_}'

