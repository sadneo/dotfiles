vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.g.netrw_banner = 0
vim.g.netrw_list_hide = "^./$"
vim.g.netrw_hide = 1
vim.g.netrw_bufsettings = "number relativenumber"

local opt = vim.opt
opt.confirm = true
opt.termguicolors = true

opt.spellcapcheck = ""

-- use spaces for tabs
-- tabs should be 4 tabs
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true

opt.number = true
opt.relativenumber = true

opt.foldlevel = 99
opt.foldcolumn = '0'
opt.foldlevelstart = 99
opt.foldenable = true

opt.pumheight = 10
opt.wrap = false
opt.textwidth = 100
