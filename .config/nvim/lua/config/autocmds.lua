vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        if vim.bo.filetype == "help" then
            vim.cmd("wincmd L")
        end
    end,
})

vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
    pattern = "?*",
    command = "mkview",
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    pattern = "?*",
    command = "silent! loadview",
})
