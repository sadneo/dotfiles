vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use "morhetz/gruvbox"
    use "folke/tokyonight.nvim"
    use "catppuccin/nvim"

    use "goolord/alpha-nvim"
    use "nvim-telescope/telescope.nvim"
    use "nvim-lua/plenary.nvim"
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "tpope/vim-commentary"
    use "psliwka/vim-smoothie" 

    if packer_bootstrap then
        require("packer").sync()
    end
end)

