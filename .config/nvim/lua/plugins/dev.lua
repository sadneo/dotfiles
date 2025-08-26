local dir = vim.fn.expand("~/Projects/neovim-live")
local stat = vim.loop.fs_stat(dir)

if not stat or not stat.type == "directory" then
    return {}
end

return {
    {
        "sadneo/neovim-live",
        dir = dir,
        opts = {},
    },
}
