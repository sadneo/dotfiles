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
            viewport_buffer = {
                min = 50,
            },
            scope = {
                enabled = false,
            },
            exclude = {
                filetypes = { "norg" },
            },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = true
    },
    {
        "folke/persistence.nvim",
        event = "VimEnter",
        opts = {},
        config = function(_, opts)
            local persistence = require("persistence")
            persistence.setup(opts)
            if vim.g.zellij_resurrect then
                persistence.load()
            end
            -- ponytail: one session per cwd/branch; use pane-specific paths for concurrent editors.
            vim.fn.timer_start(30000, function()
                if not persistence.active() then return end
                for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                    if vim.bo[buf].buftype == "" and vim.api.nvim_buf_get_name(buf) ~= ""
                        and not vim.tbl_contains({ "gitcommit", "gitrebase", "jj" }, vim.bo[buf].filetype) then
                        pcall(persistence.save)
                        break
                    end
                end
            end, { ["repeat"] = -1 })
        end,
    },
    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        opts = {},
    },
    {
        'echasnovski/mini.align',
        event = "VeryLazy",
        opts = {},
    },
    {
        "kevinhwang91/nvim-ufo",
        event = "VeryLazy",
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
                vim.opt.foldmethod = "expr"
                vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
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
}
