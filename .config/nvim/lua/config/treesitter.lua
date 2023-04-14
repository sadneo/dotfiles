require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "rust", "toml" },
    vim.cmd([[set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()]])
})

