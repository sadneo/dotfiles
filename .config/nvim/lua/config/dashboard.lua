local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    [[　　　 　　/＾>》, -―‐‐＜＾}]],
    [[　　　 　./:::/,≠´::::::ヽ.]],
    [[　　　　/::::〃::::／}::丿ハ]],
    [[　　　./:::::i{l|／　ﾉ／ }::}]],
    [[　　 /:::::::瓜イ＞　´＜ ,:ﾉ]],
    [[　 ./::::::|ﾉﾍ.{､　(_ﾌ_ノﾉイ＿]],
    [[　 |:::::::|／}｀ｽ /          /]],
    [[.　|::::::|(_:::つ/ ThinkPad /　neovim!]],
    [[.￣￣￣￣￣￣￣＼/＿＿＿＿＿/￣￣￣￣￣]],
}

dashboard.section.buttons.val = {
    dashboard.button("e", "ﱐ  New file", "<CMD>ene<BAR>startinsert<CR>"),

    dashboard.button("r", "  Recent files", "<CMD>Telescope oldfiles<CR>"),
    dashboard.button("f", "  Find files", "<CMD>Telescope find_files<CR>"),
    dashboard.button("g", "  Live grep", "<CMD>Telescope live_grep<CR>"),

    dashboard.button("s", "  Sync plugins", "<CMD>PackerSync<CR>"),
    dashboard.button("c", "  Configuration", "<CMD>e ~/.config/nvim/<CR>"),
    dashboard.button("q", "ﰌ  Quit", ":qa<CR>"),
}

dashboard.section.footer.val = ""

require("alpha").setup(dashboard.config) 

