vim.keymap.set("n", "i", function()
    return string.match(vim.api.nvim_get_current_line(), "%g") == nil
        and "cc" or "i"
end, {expr=true, noremap=true})

vim.keymap.set("n", "<Space>", "<NOP>")
vim.keymap.set("n", "<Leader>e", ":Telescope find_files<CR>")

