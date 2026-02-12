local filetypes = {
    "c",
    "java",
    "lua",
    "markdown",
    "markdown_inline",
    "rust",
    "toml",
    "tsx",
    "vim",
    "vimdoc",
    "yaml",
    "latex",
    "python",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter").install(filetypes)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = filetypes,
                callback = function()
                    vim.treesitter.start()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    }
}
