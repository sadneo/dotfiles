-- horizontal help
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        if vim.bo.filetype == "help" then
            vim.cmd("wincmd L")
        end
    end,
})

-- automatically save views
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
    pattern = "?*",
    command = "mkview",
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    pattern = "?*",
    command = "silent! loadview",
})

-- enable inlay hints
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
    end,
})
