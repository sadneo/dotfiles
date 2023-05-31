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
	dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
	dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
	dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
	dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
	dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

dashboard.section.footer.val = "Virtue is what you do when nobody is looking. The rest is marketing. - Nassim Nicholas Taleb"

require("alpha").setup(dashboard.config) 

require("lualine").setup {
  options = {
    theme = "auto",
    globalstatus = true,
    component_separators = { left = "|", right = "|"},
    section_separators = { left = "", right = ""},
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch"},
    lualine_c = {"diagnostics", "filename"},
    lualine_x = {"diff", "encoding", "fileformat", "filetype"},
    lualine_y = {"location"},
    lualine_z = {"progress"}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
}

