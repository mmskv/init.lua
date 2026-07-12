local ts = require('nvim-treesitter')

ts.install({
    "python", "latex", "terraform", "fish", "yaml", "c", "cpp",
    "lua", "vim", "vimdoc", "diff", "markdown", "markdown_inline",
})

-- start highlighting (and auto-install missing parsers) per buffer
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('mmskv-treesitter', { clear = true }),
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if not lang then return end
        if not pcall(vim.treesitter.start, args.buf, lang) then
            if vim.tbl_contains(require('nvim-treesitter.config').get_available(), lang) then
                ts.install(lang):await(function()
                    if vim.api.nvim_buf_is_valid(args.buf) then
                        pcall(vim.treesitter.start, args.buf, lang)
                    end
                end)
            end
        end
    end,
})
