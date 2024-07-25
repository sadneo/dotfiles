return {
    {
        "nvim-neorg/neorg",
        ft = "norg",
        cmd = "Neorg",
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
                    default_keybinds = false,
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
