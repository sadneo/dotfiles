local options = ({
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = false,

	autoindent = true,
	number = true,
    relativenumber = true,
	foldenable = false,
	foldmethod = "syntax",
})

for option, value in pairs(options) do
	vim.opt[option] = value
end

vim.cmd.colorscheme("tokyonight-night")
vim.keymap.set("n", "<Space>", "<Nop>")
vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>e", ":Telescope find_files<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.api.nvim_create_autocmd({"BufEnter"}, {
    callback = function()
        if vim.bo.filetype == "help" then
            vim.cmd("wincmd L")
        end
    end,
})

vim.api.nvim_create_autocmd({"BufWinLeave"}, {
	pattern = "?*",
	command = "mkview",
})
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
	pattern = "?*",
	command = "silent! loadview",
})

