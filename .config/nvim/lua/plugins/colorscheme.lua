vim.o.background = "dark"

return {
	{ "ayu-theme/ayu-vim",
		config = function()
            vim.g.ayucolor = "dark"
		end,
	},
    { "kepano/flexoki-neovim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("flexoki-dark")
        end,
    },
	{ "rose-pine/neovim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "rebelot/kanagawa.nvim" },
}


