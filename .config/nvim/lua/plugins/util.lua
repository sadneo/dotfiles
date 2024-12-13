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
        event = "VeryLazy",
        main = "ibl",
        opts = {
            exclude = { filetypes = { "norg" } },
            scope = { enabled = false },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = true
    },
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
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        keys = {
            {
                "zR",
                function()
                    require("ufo").openAllFolds()
                end,
            },
            {
                "zM",
                function()
                    require("ufo").closeAllFolds()
                end,
            },
        },
        opts = {
            open_fold_hl_timeout = 0,
            provider_selector = function(_, _, _)
                return { "treesitter", "indent" }
            end,
        },
    },
    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        enabled = false,
        config = function()
            if os.getenv("SSH_TTY") == nil then
                require("neoscroll").setup()
            end
        end,
    },
    {
        "andweeb/presence.nvim",
        event = "VeryLazy",
    }
}
