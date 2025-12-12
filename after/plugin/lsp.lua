vim.lsp.config['lua_ls'] = {
    cmd = { 'lua-language-server' },
    on_init = function(client)
        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT'
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        })
    end,
    settings = {
        Lua = {}
    }
}

vim.lsp.config['vtsls'] = {
    cmd = { 'vtsls', '--stdio' },
    settings = {
        vtsls = {
            autoUseWorkspaceTsdk = true,
            experimental = {
                completion = {
                    enableServerSideFuzzyMatch = true,
                },
            },
            typescript = {
                tsserver = { maxTsServerMemory = 16000 },
            }
        },
    },
}

vim.lsp.config['tailwindcss'] = {
    cmd = { 'tailwindcss-language-server', '--stdio' },
}

vim.lsp.config['nixd'] = {
    cmd = { 'nixd' },
    settings = {
        nixd = {
            formatting = {
                command = { "alejandra" },
            },
            options = {
                nixos = {
                    expr = '(builtins.getFlake \"/home/suck/dotfiles\").nixosConfigurations.Wintermute.options',
                },
                home_manager = {
                    expr =
                    '(builtins.getFlake \"/home/suck/dotfiles\").nixosConfigurations.Wintermute.options.home-manager.users.type.getSubOptions []',
                },
            },
        },
    }
}

vim.lsp.config['rust_analyzer'] = {
    cmd = { 'rust-analyzer' },
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                allTargets = false,
            },
        }
    }
}

vim.lsp.config['clangd'] = {
    cmd = { 'clangd' },
}

vim.lsp.config['pyright'] = {
    cmd = { 'pyright-langserver', '--stdio' },
}

vim.lsp.config['gopls'] = {
    cmd = { 'gopls' },
}

vim.lsp.enable('lua_ls')
vim.lsp.enable('vtsls')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('nixd')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('clangd')
vim.lsp.enable('pyright')
vim.lsp.enable('gopls')

require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    }),
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
    end,
})

require('illuminate').configure({
    providers = {
        'lsp',
        'treesitter',
    },
    delay = 50,
    under_cursor = false,
})
