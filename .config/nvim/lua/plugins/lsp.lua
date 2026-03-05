return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        ft = { "rust", "lua", "python" },
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
        end,
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^8',
        lazy = false,   -- It's a ftplugin, it handles its own lazy loading
        init = function()
            vim.g.rustaceanvim = {
                -- LSP configuration
                server = {
                    on_attach = function(_, bufnr)
                        -- Force enable inlay hints on attach for Neovim 0.10+
                        if vim.lsp.inlay_hint then
                            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                        end
                    end,
                    default_settings = {
                        -- rust-analyzer language server configuration
                        ['rust-analyzer'] = {
                            cargo = {
                                allFeatures = true,
                                buildScripts = {
                                    enable = true,
                                },
                            },
                            inlayHints = {
                                typeHints = { enable = true },
                                parameterHints = { enable = true },
                                chainingHints = { enable = true },
                            },
                            checkOnSave = true,
                            procMacro = {
                                enable = true,
                                -- Add this: it allows RA to use its own helper for macros
                                attributes = { enable = true },
                            },
                            rustfmt = {
                                rangeFormatting = { enable = true },
                            },
                            workspace = {
                                symbol = {
                                    search = {
                                        scope = "workspace_and_dependencies",
                                    },
                                },
                            },
                            cachePriming = {
                                enable = true,
                            },
                        },
                    },
                },
            }
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
                    null_ls.builtins.formatting.shfmt,
                },
            })
        end,
    },
}
