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
--   "        `       --._    `-._   `-.   `.     :   /  .'   .-'   _.-'    _.--'                 ",
--   "        `--.__     `--._   `-._  `-.  `. `. : .' .'  .-'  _.-'   _.--'     __.--'           ",
--   "           __    `--.__    `--._  `-._ `-. `. :/ .' .-' _.-'  _.--'    __.--'    __         ",
--   "            `--..__   `--.__   `--._ `-._`-.`_=_'.-'_.-' _.--'   __.--'   __..--'           ",
--   "          --..__   `--..__  `--.__  `--._`-q(-_-)p-'_.--'  __.--'  __..--'   __..--         ",
--   "                ``--..__  `--..__ `--.__ `-'_) (_`-' __.--' __..--'  __..--''               ",
--   "          ...___        ``--..__ `--..__`--/__/  --'__..--' __..--''        ___...          ",
--   "                ```---...___    ``--..__`_(<_   _/)_'__..--''    ___...---'''               ",
--   "           ```-----....._____```---...___(____|_/__)___...---'''_____.....-----'''          ",
}

dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", "<CMD>ene<BAR>startinsert<CR>"),
    dashboard.button("c", "  Configuration", "<CMD>e ~/.config/nvim/lua/config<CR>"),
    dashboard.button("q", "  Quit", ":qa<CR>"),
}

dashboard.section.footer.val = "Virtue is what you do when nobody is looking. The rest is marketing. - Nassim Nicholas Taleb"

require("alpha").setup(dashboard.config) 

