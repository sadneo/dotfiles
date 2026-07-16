return {
    {
        "nvim-mini/mini.starter",
        version = false,
        event = "VimEnter",
        cond = function()
            return vim.fn.argc(-1) == 0
        end,
        opts = function()
            return {
                evaluate_single = true,
                items = {
                    { name = "Insert",          action = "enew",                              section = "Actions" },
                    {
                        name = "Restore session",
                        action = function()
                            require("lazy").load({ plugins = { "persistence.nvim" } })
                            require("persistence").load()
                        end,
                        section = "Actions",
                    },
                    { name = "Lazy",            action = "Lazy",                              section = "Actions" },
                    { name = "Quit",            action = "qa",                                section = "Actions" },
                },
                footer = "Time to do work.",
            }
        end,
        config = function(_, opts)
            local starter = require("mini.starter")
            starter.setup(opts)
            vim.schedule(function()
                if vim.fn.argc(-1) == 0 then
                    starter.open()
                end
            end)
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                theme = "solarized",
                globalstatus = true,
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { "diagnostics", "filename" },
                lualine_x = { "diff", "encoding", "fileformat", "filetype" },
                lualine_y = { "location" },
                lualine_z = { "progress" }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {}
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
        keys = {
            {
                "<Leader>e", function()
                    require("telescope.builtin").find_files()
                end,
            },
            {
                "<Leader>r", function()
                    require("telescope.builtin").live_grep()
                end,
            },
            {
                "gr", function()
                    require("telescope.builtin").lsp_references()
                end,
            },
        },
        opts = {
            defaults = {
                borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
            },
        },
    },
    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        opts = {
            confirmation = {
                border = "none",
            },
        },
    },
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        opts = {
            auto_close = true,
            focus = true,
            indent_guides = false,
        },
        keys = {
            {
                "<leader>x",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
        },
    },
    {
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble", "TodoTelescope" },
        opts = {},
        keys = {
            { "<leader>z", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
        },
    },
    {
        "akinsho/bufferline.nvim",
        event = "BufAdd",
        opts = {
            options = {
                always_show_bufferline = false,
                buffer_close_icon = " ",
                modified_icon = "*",
                close_icon = " ",
            },
        },
        keys = {
            { "<M-c>",   "<cmd>bd<cr>" },
            { "<M-l>",   "<cmd>BufferLineCycleNext<cr>" },
            { "<M-h>",   "<cmd>BufferLineCyclePrev<cr>" },
            { "<M-S-l>", "<cmd>BufferLineMoveNext<cr>" },
            { "<M-S-h>", "<cmd>BufferLineMovePrev<cr>" },
        },
    },
}
