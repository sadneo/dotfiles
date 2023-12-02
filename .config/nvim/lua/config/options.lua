vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opt = vim.opt
opt.confirm = true

opt.tabstop = 4
opt.softtabstop = -1
opt.shiftwidth = 4
opt.expandtab = true

opt.autoindent = true
opt.number = true
opt.relativenumber = true
opt.foldenable = false
opt.foldmethod = "syntax"

opt.wrap = false
