return {
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
        },
        opts = {
            defaults = {
                borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
            },
        },
    },
    {
        "stevearc/oil.nvim",
        event = "VeryLazy",
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
                modified_icon = "•"
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
