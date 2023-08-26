return {
    {
        "williamboman/mason.nvim",
        opts = {},
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = true,
    },
	"neovim/nvim-lspconfig",
	{ "hrsh7th/nvim-cmp", requires = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	}, config = function()
        local cmp = require("cmp")
        cmp.setup.filetype("rust", {
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" }
            })
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" }
            }, {
                { name = "cmdline" }
            })
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        print(capabilities)
        require("lspconfig").rust_analyzer.setup({
            capabilities = capabilities,
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
    end},
}

