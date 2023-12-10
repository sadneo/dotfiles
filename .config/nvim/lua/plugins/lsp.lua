return {
    {
        "williamboman/mason.nvim",
        priority = 20,
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        priority = 25,
        config = true,
    },
	"neovim/nvim-lspconfig",
	{
        "hrsh7th/nvim-cmp",
        priority = 30,
        dependencies = {
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                    {
                        name = "cmdline",
                        max_item_count = 10,
                    },
                })
            })

            require("lspconfig").rust_analyzer.setup({
                on_attach = function(client)
                    require("completion").on_attach(client)
                end,
                settings = {
                    ["rust-analyzer"] = {
                        diagnostics = {
                            enable = true,
                        },
                        imports = {
                            granularity = {
                                group = "module",
                            },
                            prefix = "self",
                        },
                        cargo = {
                            buildScripts = {
                                enable = true,
                            },
                        },
                        procMacro = {
                            enable = true
                        },
                    }
                }
            })

        end,
    },
}

