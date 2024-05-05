return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
        lazy = true,
    },
    {
        "nvim-neorg/neorg",
        ft = "norg",
        cmd = "Neorg",
        dependencies = { "vhyrro/luarocks.nvim" },
        keys = {
            {
                "<Leader>t",
                function()
                    vim.cmd("Neorg toggle-concealer")
                end,
            },
        },
        opts = {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.keybinds"] = {
                    config = {
                        hook = function(keybinds)
                            keybinds.remap_event("norg", "n", "<C-CR>", "core.looking-glass.magnify-code-block")
                        end,
                    },
                },
                ["core.itero"] = {
                    config = {
                        iterables = { "unordered_list%d", "ordered_list%d" },
                    },
                },
                ["core.dirman"] = {
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
