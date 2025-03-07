require("mmskv.set")
require("mmskv.remap")
require("mmskv.autoresize")
require("mmskv.lastplace")

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

autocmd({ "VimEnter" }, {
    group = mmskv,
    pattern = "*",
    command = 'lcd %:p:h', -- set cwd to opened path
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
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("mmskv.lazy")
