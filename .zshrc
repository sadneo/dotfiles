# Credit to base config
# https://github.com/MrElendig/dotfiles-alice/blob/master/.zshrc

#------------------------------
# Aliases
#------------------------------
# TODO: test if eza exists, if not, then create ls aliases instead
alias tree="eza -T --sort type --git-ignore"
alias ls="eza --sort type"
alias ll="eza -lg --sort type"
alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

#------------------------------
# History stuff
#------------------------------
HISTFILE="$XDG_STATE_HOME/zhistory"
HISTSIZE=1000
SAVEHIST=30

#------------------------------
# Keybindings
#------------------------------
bindkey -e
typeset -g -A key

# alt+k/l instead of up/down arrow for history
bindkey '^[k' up-line-or-history
bindkey '^[j' down-line-or-history

# C-w like bash
zle -N backward-kill-bash-word
# exclude /:@
backward-kill-bash-word() WORDCHARS="~!#$%^&*(){}[]<>?.+;-_" zle .backward-kill-word
bindkey "^W" backward-kill-bash-word

# chatgpt moment
toggle_vim() {
    if jobs % > /dev/null 2>&1; then
        fg
    fi
}

zle -N toggle_vim
bindkey '^Z' toggle_vim

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

#------------------------------
# ShellFuncs
#------------------------------
# Colored Manuals
function man() {
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

# OSC 7 for foot
autoload -U add-zsh-hook
function osc7-pwd() {
    emulate -L zsh
    setopt extendedglob
    local LC_ALL=C
    printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}

function chpwd-osc7-pwd() {
    (( ZSH_SUBSHELL )) || osc7-pwd
}
add-zsh-hook -Uz chpwd chpwd-osc7-pwd

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

function check_ssh() {
    if [[ -n "$SSH_TTY" ]]; then
        echo "yellow"
    else
        echo "cyan"
    fi
}

function precmd() {
    vcs_info
    print -Pn "\e]133;A\e\\" # Prompt Jumping
}
setopt prompt_subst

PROMPT='$(check_git_status)${vcs_info_msg_0_}%F{$(check_ssh)}[%~]%f%(!.#.$) '
