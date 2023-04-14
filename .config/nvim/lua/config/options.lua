local options = ({
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,

	number = true,
	foldenable = false,
	foldmethod = "syntax",
	foldnestmax = 10,
	foldlevel = 10,
});

for option, value in pairs(options) do
	vim.opt[option] = value
end

-- nvim terminal escape keybind
vim.cmd [[tnoremap <Esc> <C-\><C-n>]]

-- help vertical split
vim.cmd[[autocmd! BufEnter * if &ft ==# 'help' | wincmd L | endif]]

-- save views
-- vim.cmd [[au BufWritePost,BufLeave,WinLeave ?* mkview
-- au BufReadPre ?* silent! loadview]]

