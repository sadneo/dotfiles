vim.o.background = "dark" -- ayu uses this

return {
	{
		"Shatur/neovim-ayu",
		lazy = false,
		config = function()
			local colors = require('ayu.colors')
			colors.generate() -- Pass `true` to enable mirage

			require('ayu').setup({
				overrides = {
					LineNr = { fg = colors.guide_active },
				},
			})

			-- vim.cmd.colorscheme("ayu")
		end,
	},
    { "stevedylandev/flexoki-nvim", lazy = false,
        config = function()
            vim.cmd.colorscheme("flexoki")
        end,
    },
	{ "folke/tokyonight.nvim", lazy = true, },
	{ "rebelot/kanagawa.nvim", lazy = true, },
}


