return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        ft = { "rust", "lua" },
        keys = {
            {
                "<Leader>f",
                function()
                    vim.lsp.buf.format()
                end,
            }
        },
        config = function()
            local lspconfig = vim.lsp.config

            vim.lsp.enable("ruff")
            lspconfig.lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                    },
                },
            }
            vim.lsp.enable("lua_ls")

            lspconfig.rust_analyzer = {
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            features = "all",
                            buildScripts = {
                                enable = true,
                            },
                        },
                        inlayHints = {
                            typeHints = true,
                            parameterHints = true,
                            chainingHints = true,
                        },
                        checkOnSave = true,
                        -- checkOnSave = {
                        --     features = "all",
                        --     command = "clippy",
                        --     extraArgs = { "--no-deps" },
                        -- },
                        procMacro = {
                            enable = true
                        },
                        rustfmt = {
                            rangeFormatting = { enable = true },
                        },
                    }
                }
            }
            vim.lsp.enable("rust_analyzer")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        event = "CmdlineEnter",
        config = function()
            local cmp = require("cmp")

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                    { name = "cmdline" },
                })
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                debug = true,
                sources = {
                    null_ls.builtins.formatting.nixfmt,
                },
            })
        end,
    },
}
