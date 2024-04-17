return {
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            exclude = { filetypes = { "norg" } },
            scope = { enabled = false },
        },
    },
    { "lewis6991/gitsigns.nvim", config = true },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = { options = vim.opt.sessionoptions:get() },
    },
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "andweeb/presence.nvim",
    }
}
