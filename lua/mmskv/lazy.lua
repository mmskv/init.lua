require("lazy").setup({
    { 'nvim-treesitter/nvim-treesitter',         build = ':TSUpdate' },
    { 'nvim-treesitter/nvim-treesitter-context', build = ':TSUpdate' },

    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',

    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
    },
    "rafamadriz/friendly-snippets",

    "stevearc/conform.nvim",

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        keys = { { "<leader>cop", "<cmd>Copilot enable<CR>" }, },
        config = function()
            require("copilot").setup({
                suggestion = {
                    auto_trigger = true,
                    keymap = {
                        accept = "<C-l>",
                        accept_word = false,
                        accept_line = false,
                        next = "<C-j>",
                        prev = "<C-k>",
                        dismiss = "<C-h>",
                    }
                }
            })
        end,
    },

    {
        "rebelot/kanagawa.nvim",
        name = 'kanagawa',
        config = function()
            require('kanagawa').setup({
                compile = true,
                commentStyle = { italic = false },
                keywordStyle = { italic = false },
                background = {
                    dark = "dragon",
                },
                colors = {
                    theme = {
                        all = {
                            syn = {
                                identifier = "#b98d7b",
                            },
                            ui = {
                                bg_gutter = "none"
                            },
                            diag = {
                                ok      = "#98BB6C",
                                error   = "#E46876",
                                warning = "#FFA066",
                                info    = "#7AA89F",
                            },
                        }
                    }
                },
                overrides = function(colors)
                    local theme = colors.theme
                    local palette = colors.palette
                    return {
                        NormalFloat = { bg = "none" },
                        FloatTitle = { bg = "none" },

                        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

                        TelescopeTitle = { fg = theme.ui.special, bold = true },
                        TelescopeMatching = { fg = palette.surimiOrange },
                        TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                        TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                        TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                        TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                        TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                        TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
                    }
                end,
            })

            vim.cmd('colorscheme kanagawa-dragon')
        end
    },

    'mbbill/undotree',
    'nvim-telescope/telescope.nvim',
    "theprimeagen/refactoring.nvim",
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Trouble",
    },

    {
        'mrcjkb/haskell-tools.nvim',
        version = '^4',
        lazy = false,
    },

    {
        "lervag/vimtex",
        lazy = true, -- we don't want to lazy load VimTeX
        init = function()
            vim.g.vimtex_view_method = 'zathura'
        end
    },
    'norcalli/nvim-colorizer.lua',
    'tpope/vim-fugitive',

    {
        'ruifm/gitlinker.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
    },

    "rrethy/vim-illuminate",
    "eandrju/cellular-automaton.nvim",
})
