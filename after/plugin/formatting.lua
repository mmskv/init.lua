vim.keymap.set("", "<leader>f", function()
    require("conform").format({ async = true, lsp_fallback = "always" })
end)

require("conform").setup({
    formatters_by_ft = {
        ["_"] = { "trim_whitespace", "trim_newlines" },
        python = { "isort", "black" },
        markdown = { "markdownlint" },
        nix = { "alejandra" },
        javascript = { "prettierd" },
        jsonc = { "prettierd" },
        css = { "prettierd" },
        yaml = { "yamlfmt" },
    },
    format_on_save = { timeout_ms = 500, lsp_fallback = "always" },
})
