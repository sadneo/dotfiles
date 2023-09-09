return {
    "folke/lazy.nvim",
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {
            -- add any custom options here
        }
    },
    "tpope/vim-commentary",
    "psliwka/vim-smoothie",
    "dstein64/vim-startuptime",
}
