function fish_prompt
    set -l git_branch ''
    set -l git_star ''
    set -l pwd_color 'cyan'

    if git rev-parse --is-inside-work-tree &>/dev/null
        set git_branch (git symbolic-ref --short HEAD 2>/dev/null)
        set git_branch (set_color green)"[$git_branch]"(set_color normal)

        set -l git_status (git status --porcelain 2>/dev/null)
        if test -n "$git_status"
            set git_star (set_color red)'*'(set_color normal)
        end
    end

    if test -n "$IN_NIX_SHELL"
        set pwd_color 'green'
    end

    echo -ns "$git_star$git_branch" (set_color $pwd_color) "[$(prompt_pwd)]" (set_color normal) ' '
end

function fish_right_prompt
    if test -n "$SSH_TTY"
        echo -ns (set_color yellow) "["(cat /proc/sys/kernel/hostname)"]" (set_color normal)
    end
end
