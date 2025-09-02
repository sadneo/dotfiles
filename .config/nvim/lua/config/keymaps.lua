vim.keymap.set("n", "i", function()
    return string.match(vim.api.nvim_get_current_line(), "%g") == nil
        and "cc" or "i"
end, { expr = true, noremap = true })

vim.keymap.set("n", "<Space>", "<NOP>")
vim.keymap.set({ "n", "v" }, "<Leader>y", "\"+y")
vim.keymap.set({ "n", "v" }, "<Leader>p", "\"+p")
vim.keymap.set({ "n", "v" }, "<Leader>d", "\"+d")
vim.keymap.set({ "n", "v" }, "<Leader>Y", "\"+Y")

vim.keymap.set("n", "<C-c>", ":%y +<CR>")
vim.keymap.set("n", "<C-S-l>", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)
vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
end)
