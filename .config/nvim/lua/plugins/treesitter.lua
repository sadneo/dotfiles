require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "rust", "toml" },
	auto_install = true,
})

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
