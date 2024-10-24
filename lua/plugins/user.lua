-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
    { "rose-pine/neovim",
        priority = 150,
        lazy = false,
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                variant = "moon", -- auto, main, moon, or dawn
                dark_variant = "moon", -- main, moon, or dawn
                dim_inactive_windows = false,
                extend_background_behind_borders = true,

                enable = {
                    terminal = true,
                    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                    migrations = true, -- Handle deprecated options automatically
                },

                styles = {
                    bold = true,
                    italic = true,
                    transparency = false,
                },

                groups = {
                    border = "muted",
                    link = "iris",
                    panel = "surface",

                    error = "love",
                    hint = "iris",
                    info = "foam",
                    note = "pine",
                    todo = "rose",
                    warn = "gold",

                    git_add = "foam",
                    git_change = "rose",
                    git_delete = "love",
                    git_dirty = "rose",
                    git_ignore = "muted",
                    git_merge = "iris",
                    git_rename = "pine",
                    git_stage = "iris",
                    git_text = "rose",
                    git_untracked = "subtle",

                    h1 = "iris",
                    h2 = "foam",
                    h3 = "rose",
                    h4 = "gold",
                    h5 = "pine",
                    h6 = "foam",
                },

                highlight_groups = {
                    -- Comment = { fg = "foam" },
                    -- VertSplit = { fg = "muted", bg = "muted" },
                },

                before_highlight = function(group, highlight, palette)
                    -- Disable all undercurls
                    -- if highlight.undercurl then
                    --     highlight.undercurl = false
                    -- end
                    --
                    -- Change palette colour
                    -- if highlight.fg == palette.pine then
                    --     highlight.fg = palette.foam
                    -- end
                end,
            })

            -- vim.cmd("colorscheme rose-pine-main")
            -- vim.cmd("colorscheme rose-pine-moon")
            -- vim.cmd("colorscheme rose-pine-dawn")
        end
    },
    -- {
    --     "elixir-tools/elixir-tools.nvim",
    --     version = "*",
    --     event = { "BufReadPre", "BufNewFile" },
    --     config = function()
    --         local elixir = require("elixir")
    --         local elixirls = require("elixir.elixirls")
    --
    --         elixir.setup {
    --             nextls = {enable = true},
    --             credo = {},
    --             elixirls = {
    --                 enable = true,
    --                 settings = elixirls.settings {
    --                     dialyzerEnabled = false,
    --                     enableTestLenses = false,
    --                 },
    --                 on_attach = function(client, bufnr)
    --                     vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
    --                     vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
    --                     vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
    --                 end,
    --             }
    --         }
    --     end,
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --     },
    -- },
    {'iamcco/markdown-preview.nvim', build = function() vim.fn["mkdp#util#install"]() end, lazy = false},
    'elihunter173/dirbuf.nvim',
    {'famiu/bufdelete.nvim', lazy = false},
    {'ggandor/leap.nvim',
        dependencies = 'tpope/vim-repeat',
        lazy = false, config = function()
            require('leap').add_default_mappings()
        end
    },
    {
        'NeogitOrg/neogit',
        dependencies = 'nvim-lua/plenary.nvim',
        lazy = false,
        config = function()
            require('neogit').setup {
                disable_commit_confirmation = true,
                integrations = {diffview = true}
            }
        end
    }, 
    'sindrets/diffview.nvim', 
    'mfussenegger/nvim-jdtls', {
        'kiyoon/jupynium.nvim',
        build = "pip3 install --user .",
        lazy = false,
        config = function()
            vim.keymap.set("n", "<leader>jq", ":JupyniumStopSync<CR>",
                {desc = "Stop Jupynium Sync"})
            vim.keymap.set("n", "<leader>jw", ":JupyniumStartSync<CR>",
                {desc = "Start Jupynium Sync"})
            vim.keymap.set("n", "<leader>ja",
                ":JupyniumStartAndAttachToServerInTerminal<CR>",
                {desc = "Start Jupynium Process"})
        end
    }, 'stevearc/dressing.nvim', {
        "catppuccin/nvim",
        lazy = false,
        priority = 150,
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                background = {light = "latte", dark = "mocha"},
                color_overrides = {
                    mocha = {
                        rosewater = "#EA6962",
                        flamingo = "#EA6962",
                        pink = "#D3869B",
                        mauve = "#D3869B",
                        red = "#EA6962",
                        maroon = "#EA6962",
                        peach = "#BD6F3E",
                        yellow = "#D8A657",
                        green = "#A9B665",
                        teal = "#89B482",
                        sky = "#89B482",
                        sapphire = "#89B482",
                        blue = "#7DAEA3",
                        lavender = "#7DAEA3",
                        text = "#D4BE98",
                        subtext1 = "#BDAE8B",
                        subtext0 = "#A69372",
                        overlay2 = "#8C7A58",
                        overlay1 = "#735F3F",
                        overlay0 = "#5A4525",
                        surface2 = "#4B4F51",
                        surface1 = "#2A2D2E",
                        surface0 = "#232728",
                        base = "#1D2021",
                        mantle = "#191C1D",
                        crust = "#151819"
                    },
                    latte = {
                        rosewater = "#c14a4a",
                        flamingo = "#c14a4a",
                        pink = "#945e80",
                        mauve = "#945e80",
                        red = "#c14a4a",
                        maroon = "#c14a4a",
                        peach = "#c35e0a",
                        yellow = "#a96b2c",
                        green = "#6c782e",
                        teal = "#4c7a5d",
                        sky = "#4c7a5d",
                        sapphire = "#4c7a5d",
                        blue = "#45707a",
                        lavender = "#45707a",
                        text = "#654735",
                        subtext1 = "#7b5d44",
                        subtext0 = "#8f6f56",
                        overlay2 = "#a28368",
                        overlay1 = "#b6977a",
                        overlay0 = "#c9aa8c",
                        surface2 = "#A79C86",
                        surface1 = "#C9C19F",
                        surface0 = "#DFD6B1",
                        base = "#fbf1c7",
                        mantle = "#F3EAC1",
                        crust = "#E7DEB7"
                    }
                },
                styles = {
                    comments = {"italic"},
                    conditionals = {"italic"},
                    loops = {"bold"},
                    functions = {"bold"},
                    keywords = {"bold"},
                    strings = {},
                    variables = {},
                    numbers = {"bold"},
                    booleans = {"bold"},
                    properties = {},
                    types = {"bold"},
                    operators = {}
                },
                transparent_background = false,
                show_end_of_buffer = false,
                custom_highlights = function(colors)
                    return {
                        NormalFloat = {bg = colors.crust},
                        FloatBorder = {bg = colors.crust, fg = colors.crust},
                        VertSplit = {bg = colors.base, fg = colors.surface0},
                        CursorLineNr = {fg = colors.mauve, style = {"bold"}},
                        Pmenu = {bg = colors.crust, fg = ""},
                        PmenuSel = {bg = colors.surface0, fg = ""},
                        TelescopeSelection = {bg = colors.surface0},
                        TelescopePromptCounter = {
                            fg = colors.mauve,
                            style = {"bold"}
                        },
                        TelescopePromptPrefix = {bg = colors.surface0},
                        TelescopePromptNormal = {bg = colors.surface0},
                        TelescopeResultsNormal = {bg = colors.mantle},
                        TelescopePreviewNormal = {bg = colors.crust},
                        TelescopePromptBorder = {
                            bg = colors.surface0,
                            fg = colors.surface0
                        },
                        TelescopeResultsBorder = {
                            bg = colors.mantle,
                            fg = colors.mantle
                        },
                        TelescopePreviewBorder = {
                            bg = colors.crust,
                            fg = colors.crust
                        },
                        TelescopePromptTitle = {
                            fg = colors.surface0,
                            bg = colors.surface0
                        },
                        TelescopeResultsTitle = {
                            fg = colors.mantle,
                            bg = colors.mantle
                        },
                        TelescopePreviewTitle = {
                            fg = colors.crust,
                            bg = colors.crust
                        },
                        IndentBlanklineChar = {fg = colors.surface0},
                        IndentBlanklineContextChar = {fg = colors.surface2},
                        GitSignsChange = {fg = colors.peach},
                        NvimTreeIndentMarker = {link = "IndentBlanklineChar"},
                        NvimTreeExecFile = {fg = colors.text}
                    }
                end
            })
        end
    },
    -- == Examples of Adding Plugins ==

    "andweeb/presence.nvim",
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require("lsp_signature").setup() end,
    },

    -- == Examples of Overriding Plugins ==

    -- customize alpha options
    {
        "goolord/alpha-nvim",
        opts = function(_, opts)
            -- customize the dashboard header
            opts.section.header.val = {
                " █████  ███████ ████████ ██████   ██████",
                "██   ██ ██         ██    ██   ██ ██    ██",
                "███████ ███████    ██    ██████  ██    ██",
                "██   ██      ██    ██    ██   ██ ██    ██",
                "██   ██ ███████    ██    ██   ██  ██████",
                " ",
                "    ███    ██ ██    ██ ██ ███    ███",
                "    ████   ██ ██    ██ ██ ████  ████",
                "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
                "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
                "    ██   ████   ████   ██ ██      ██",
            }
            return opts
        end,
    },

    -- You can disable default plugins as follows:
    "max397574/better-escape.nvim",

    -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
    {
        "L3MON4D3/LuaSnip",
        config = function(plugin, opts)
            require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
            -- add more custom luasnip configuration such as filetype extend or custom snippets
            local luasnip = require "luasnip"
            luasnip.filetype_extend("javascript", { "javascriptreact" })
        end,
    },

    {
        "windwp/nvim-autopairs",
        config = function(plugin, opts)
            require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
            -- add more custom autopairs configuration such as custom rules
            local npairs = require "nvim-autopairs"
            local Rule = require "nvim-autopairs.rule"
            local cond = require "nvim-autopairs.conds"
            npairs.add_rules(
                {
                    Rule("$", "$", { "tex", "latex" })
                        -- don't add a pair if the next character is %
                        :with_pair(cond.not_after_regex "%%")
                        -- don't add a pair if  the previous character is xxx
                        :with_pair(
                            cond.not_before_regex("xxx", 3)
                        )
                        -- don't move right when repeat character
                        :with_move(cond.none())
                        -- don't delete if the next character is xx
                        :with_del(cond.not_after_regex "xx")
                        -- disable adding a newline when you press <cr>
                        :with_cr(cond.none()),
                },
                -- disable for .vim files, but it work for another filetypes
                Rule("a", "a", "-vim")
            )
        end,
    },
}
