return {
    {
        "nvim-neorg/neorg",
        ft = "norg",
        cmd = "Neorg",
        priority = 30,
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.keybinds"] = {
                        config = {
                            hook = function(keybinds)
                                keybinds.map("norg", "n", "p", "core.looking-glass.magnify-code-block")
                            end,
                        },
                    },
                    ["core.export"] = {},
                    ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/Documents/notes",
                        },
                        default_workspace = "notes",
                    },
                },
            },
        }
    end,
},
} 
