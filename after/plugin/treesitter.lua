require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "python", "latex", "terraform", "fish", "yaml", "jsonc", "c", "cpp", "lua", "vim", "vimdoc", "diff" },

    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
