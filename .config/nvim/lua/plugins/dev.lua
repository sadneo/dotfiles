local dir = vim.fn.expand("~/Projects/neo-live")
local stat = vim.loop.fs_stat(dir)

if not stat or not stat.type == "directory" then
    return {}
end

return {
    {
        "sadneo/neo-live",
        dir = dir,
        opts = {},
    },
}
