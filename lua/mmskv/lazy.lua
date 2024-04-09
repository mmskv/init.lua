require("lazy").setup({
    'nvim-telescope/telescope.nvim',
    "rafamadriz/friendly-snippets",

    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp"
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
                        FloatBorder = { bg = "none" },
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

                        -- Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
                        -- PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                        -- PmenuSbar = { bg = theme.ui.bg_m1 },
                        -- PmenuThumb = { bg = theme.ui.bg_p2 },
                    }
                end,
            })

            vim.cmd('colorscheme kanagawa')
        end
    },

    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_fallback = "always" })
                end,
                mode = "",
                desc = "Format buffer",
            },
        },
        opts = {
            formatters_by_ft = {
                ["_"] = { "trim_whitespace" },
                python = { "isort", "black" },
                javascript = { { "prettierd", "prettier" } },
            },
            format_on_save = { timeout_ms = 500, lsp_fallback = "always" },
        },
    },

    { 'nvim-treesitter/nvim-treesitter',         build = ':TSUpdate' },
    { 'nvim-treesitter/nvim-treesitter-context', build = ':TSUpdate' },

    {
        'theprimeagen/harpoon',
        branch = 'harpoon2',
    },

    'mbbill/undotree',
    'tpope/vim-fugitive',

    {
        'ruifm/gitlinker.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },

    "rrethy/vim-illuminate",
    "theprimeagen/refactoring.nvim",

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    "folke/zen-mode.nvim",
    "eandrju/cellular-automaton.nvim",
    'norcalli/nvim-colorizer.lua',
})
