local colors = require('ayu.colors')
colors.generate() -- Pass `true` to enable mirage

require('ayu').setup({
    overrides = {
		LineNr = { fg = colors.gutter_active },
    },
})

vim.cmd.colorscheme("ayu-dark")
