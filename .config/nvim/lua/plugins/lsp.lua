return {
    { "williamboman/mason.nvim",
        priority = 20,
        config = true,
    },
    { "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig"
        },
        priority = 25,
        config = true,
    },
    { "neovim/nvim-lspconfig",
        ft = "rust",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },
        keys = {
            {
                "<Leader>f",
                function()
                    vim.lsp.buf.format()
                end,
            }
        },
        config = function()
            require("lspconfig").rust_analyzer.setup({
                on_attach = function(client)
                    vim.opt.formatexpr = vim.lsp.formatexpr()
                    require("completion").on_attach(client)
                end,
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            features = "all",
                            buildScripts = {
                                enable = true,
                            },
                        },
                        checkOnSave = {
                            features = "all",
                            command = "clippy",
                            extraArgs = { "--no-deps" },
                        },
                        procMacro = {
                            enable = true
                        },
                        rustfmt = {
                            rangeFormatting = {enable = true},
                        },
                    }
                }
            })
        end,
    },
	{ "hrsh7th/nvim-cmp",
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
        end,
    },
}
