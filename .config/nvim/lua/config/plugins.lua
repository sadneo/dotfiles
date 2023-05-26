vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use "folke/tokyonight.nvim"
    use "morhetz/gruvbox"
    use "catppuccin/nvim"

    use "goolord/alpha-nvim"
    use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" }}
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

	use { "hrsh7th/nvim-cmp", requires = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	}}

	use "neovim/nvim-lspconfig"
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"

	use {
		"nvim-neorg/neorg",
		ft = "norg",
		after = { "nvim-treesitter", "telescope.nvim" },
		run = ":Neorg sync-parsers",
	}

    use "tpope/vim-commentary"
    use "psliwka/vim-smoothie"

    if packer_bootstrap then
        require("packer").sync()
    end
end)

