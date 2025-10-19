return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("nvim-treesitter.configs").setup({
                sync_install = false,
                auto_install = false,
                ensure_installed = {
                    "c",
                    "java",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "norg",
                    "rust",
                    "toml",
                    "tsx",
                    "vim",
                    "vimdoc",
                    "yaml",
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true,
                },
                indent = { enable = true },
            })
        end,
    },
}
