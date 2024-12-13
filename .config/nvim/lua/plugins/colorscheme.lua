return {
    { "folke/tokyonight.nvim" },
    { "rebelot/kanagawa.nvim" },
    { "rose-pine/neovim" },
    {
        "miikanissi/modus-themes.nvim",
        opts = {
            variant = "tinted",
            transparent = true,
            on_highlights = function(highlights, colors)
                highlights.DiffAdd = {
                    bg = colors.bg_main,
                    fg = colors.fg_added,
                }
                highlights.DiffChange = {
                    bg = colors.bg_main,
                    fg = colors.fg_changed,
                }
                highlights.DiffDelete = {
                    bg = colors.bg_main,
                    fg = colors.fg_removed,
                }
            end,
        },
    },
}
