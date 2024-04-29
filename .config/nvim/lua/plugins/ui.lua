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

            dashboard.section.footer.val =
            "Virtue is what you do when nobody is looking. The rest is marketing. - Nassim Nicholas Taleb"

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
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { "diagnostics", "filename" },
                lualine_x = { "diff", "encoding", "fileformat", "filetype" },
                lualine_y = { "location" },
                lualine_z = { "progress" }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
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
                local dirman = require("neorg").modules.get_module("core.dirman")
                local workspace = dirman.get_current_workspace()

                require("telescope.builtin").find_files({
                    cwd = tostring(workspace[2]),
                })
            end,
            },
            {
                "<Leader>n", function()
                local dirman = require("neorg").modules.get_module("core.dirman")
                local workspaces = dirman.get_workspace_names()

                local pickers = require("telescope.pickers")
                local finders = require("telescope.finders")
                local conf = require("telescope.config").values
                local actions = require("telescope.actions")
                local action_state = require("telescope.actions.state")

                local dropdown_opts = {
                    layout_config = {
                        height = #workspaces + 4,
                    },
                    borderchars = {
                        prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
                        results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
                        preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                    },
                }

                local opts = require("telescope.themes").get_dropdown(dropdown_opts)

                pickers.new(opts, {
                    prompt_title = "Workspaces",
                    finder = finders.new_table({ results = workspaces }),
                    sorter = conf.generic_sorter(opts),
                    attach_mappings = function(prompt_bufnr, _)
                        actions.select_default:replace(function()
                            actions.close(prompt_bufnr)
                            local selection = action_state.get_selected_entry()
                            vim.cmd("Neorg workspace " .. selection[1])   -- maybe call lua instead
                        end)
                        return true
                    end,
                }):find()
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
