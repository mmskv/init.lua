require("mmskv.set")
require("mmskv.remap")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local mmskv = augroup('mmskv ', {})

autocmd({ "BufWritePre" }, {
    group = mmskv,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd({ "VimEnter" }, {
    group = mmskv,
    pattern = "*",
    command = 'if expand("%") == "" | e . | endif',
})

local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("mmskv.lazy")
