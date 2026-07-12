require("lazy").setup({
    { 'nvim-treesitter/nvim-treesitter',         branch = 'main', build = ':TSUpdate' },
    { 'nvim-treesitter/nvim-treesitter-context', build = ':TSUpdate' },

    'neovim/nvim-lspconfig',

    "stevearc/conform.nvim",

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        keys = { { "<leader>cop", "<cmd>Copilot enable<CR>" }, },
        config = function()
            require("copilot").setup({
                filetypes = { yaml = true },
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
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        ft = { 'markdown' },
        opts = {
            completions = { lsp = { enabled = true } },
        },
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
                        dragon = {
                            syn = {
                                identifier = "#b98d7b",
                            },
                            ui = {
                                bg_gutter = "none",
                                bg = "none",
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

    'nvim-telescope/telescope.nvim',
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
    { 'catgoose/nvim-colorizer.lua', opts = {} },
    'tpope/vim-fugitive',

    'linrongbin16/gitlinker.nvim',

    "rrethy/vim-illuminate",
    "eandrju/cellular-automaton.nvim",
})
