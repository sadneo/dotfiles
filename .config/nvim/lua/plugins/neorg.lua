return {
    {
        "nvim-neorg/neorg",
        ft = "norg",
        cmd = "Neorg",
        priority = 30,
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
        keys = {
            {
                "<Leader>t", function()
                    vim.cmd("Neorg toggle-concealer")
                end,
            },
        },
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {},
                ["core.keybinds"] = {
                    config = {
                        hook = function(keybinds)
                            keybinds.remap_event("norg", "n", "<C-CR>", "core.looking-glass.magnify-code-block")
                        end,
                    },
                },
                ["core.export"] = {},
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/Documents/notes",
                            personal = "~/Documents/personal",
                        },
                    },
                },
            },
        },
    },
} 
