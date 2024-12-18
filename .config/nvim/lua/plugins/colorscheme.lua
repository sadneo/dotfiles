return {
    { "folke/tokyonight.nvim", lazy = true },
    { "rebelot/kanagawa.nvim", lazy = true },
    { "rose-pine/neovim", lazy = true },
    {
        "miikanissi/modus-themes.nvim",
        lazy = true,
        opts = {
            variant = "tinted",
            transparent = true,
            on_highlights = function(highlights, colors)
                highlights.TroubleNormal.bg = colors.bg_main
                highlights.TroubleNormalNC = {
                    bg = colors.bg_main,
                    fg = colors.fg_main,
                }
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
