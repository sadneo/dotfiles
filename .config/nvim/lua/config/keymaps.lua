vim.keymap.set("n", "i", function()
    return string.match(vim.api.nvim_get_current_line(), "%g") == nil
        and "cc" or "i"
end, {expr=true, noremap=true})

vim.keymap.set("n", "<Space>", "<NOP>")
vim.keymap.set({"n", "v"}, "<Leader>y", "\"+y")
vim.keymap.set({"n", "v"}, "<Leader>p", "\"+p")
vim.keymap.set({"n", "v"}, "<Leader>d", "\"+d")

vim.keymap.set("n", "<M-h>", "gT")
vim.keymap.set("n", "<M-l>", "gt")

