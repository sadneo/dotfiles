vim.o.background = "dark"

return {
	{
		"ayu-theme/ayu-vim",
		lazy = true,
		config = function()
            vim.g.ayucolor = "dark"
		end,
	},
    { "kepano/flexoki-neovim", name = "flexoki", lazy = false,
        config = function()
            vim.cmd.colorscheme("flexoki-dark")
        end,
    },
	{ "ellisonleao/gruvbox.nvim", lazy = true, },
	{ "folke/tokyonight.nvim", lazy = true, },
	{ "rebelot/kanagawa.nvim", lazy = true, },
}


