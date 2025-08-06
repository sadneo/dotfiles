function fish_prompt
    set -l git_branch ''
    set -l git_star ''

    if git rev-parse --is-inside-work-tree &>/dev/null
        set git_branch (git symbolic-ref --short HEAD 2>/dev/null)
        set git_branch (set_color green)"[$git_branch]"(set_color normal)

        set -l git_status (git status --porcelain 2>/dev/null)
        if test -n "$git_status"
            set git_star (set_color red)'*'(set_color normal)
        end
    end

    echo -ns "$git_star$git_branch" (set_color cyan) "[$(prompt_pwd)]" (set_color normal) ' '
end
