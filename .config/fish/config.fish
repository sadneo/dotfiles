alias tree="eza -T --sort type --git-ignore"
alias ls="eza --sort type"
alias ll="eza -lg --sort type"
alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

if status is-interactive
  set fish_greeting
end

function fish_command_not_found
    echo "Command not found: $argv"
end
