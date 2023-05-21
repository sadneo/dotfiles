require("mason").setup({})
require("mason-lspconfig").setup()

local nvim_lsp = require("lspconfig")

nvim_lsp.rust_analyzer.setup({
    on_attach = function(client)
		-- require("completion").on_attach(client)
	end,
    settings = {
        ["rust-analyzer"] = {
			diagnostics = {
				enable = false,
			},
            -- imports = {
            --     granularity = {
            --         group = "module",
            --     },
            --     prefix = "self",
            -- },
            -- cargo = {
            --     buildScripts = {
            --         enable = true,
            --     },
            -- },
            -- procMacro = {
            --     enable = true
            -- },
        }
    }
})

