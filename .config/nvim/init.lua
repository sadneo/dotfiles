local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- bootstrap lazy.nvim
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("config.options")
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    defaults = {
        lazy = false,
        version = false,
    },
    change_detection = {
        enabled = false,
    },
    install = { colorscheme = { "modus", "habamax" } },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

vim.opt.background = "light"
vim.cmd.colorscheme("modus")
require("config.autocmds")
require("config.keymaps")
