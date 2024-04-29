vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.g.netrw_banner = 0
vim.g.netrw_list_hide = "^./$"
vim.g.netrw_hide = 1
vim.g.netrw_bufsettings = "number relativenumber"

local opt = vim.opt
opt.confirm = true
opt.background = "light"

opt.tabstop = 4
opt.softtabstop = -1
opt.shiftwidth = 4
opt.expandtab = true

opt.autoindent = true
opt.number = true
opt.relativenumber = true
opt.foldenable = false
opt.foldmethod = "syntax"

opt.pumheight = 10
opt.wrap = false
opt.textwidth = 100
