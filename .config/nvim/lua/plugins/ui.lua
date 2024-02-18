return {
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
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
                dashboard.button("i", "  New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("n", "  Notes", ":Neorg workspace notes <CR>"),
                dashboard.button("v", "  To do", ":Neorg workspace personal <CR>"),
                dashboard.button("c", "  Config", ":Explore $XDG_CONFIG_HOME/nvim <CR>"),
                dashboard.button("s", "  Restore Session", ":lua require('persistence').load() <CR>"),
                dashboard.button("d", "  Previous Session", ":lua require('persistence').load({ last = true }) <CR>"),
                dashboard.button("q", "  Quit", ":qa <CR>"),
            }

            dashboard.section.footer.val = "Virtue is what you do when nobody is looking. The rest is marketing. - Nassim Nicholas Taleb"

            require("alpha").setup(dashboard.config) 
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
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
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
        keys = {
            {
                "<Leader>e", function()
                    local dirman = require("neorg").modules.loaded_modules["core.dirman"].public
                    local workspace = dirman.get_current_workspace()
                    local path = nil

                    if workspace[1] ~= "default" then
                        path = {workspace[2]}
                    end

                    require("telescope.builtin").find_files({
                        search_dirs = path,
                    })
                end,
            },
        },
        opts = {
            defaults = {
                borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
            },
        },
    },
}
