vim.api.nvim_create_autocmd({ "BufEnter" }, {
    callback = function()
        if vim.bo.filetype == "help" then
            vim.cmd("wincmd L")
        end
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "text",
    callback = function()
        vim.opt.textwidth = 80
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
