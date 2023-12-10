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
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup()
        end,
    },
    "dstein64/vim-startuptime",
}
