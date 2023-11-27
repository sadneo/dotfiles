vim.o.background = "dark" -- ayu uses this

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
	{ "folke/tokyonight.nvim", lazy = true, },
	{ "rebelot/kanagawa.nvim", lazy = true, },
}


