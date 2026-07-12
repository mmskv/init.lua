vim.cmd.packadd('nvim.undotree')

vim.keymap.set("n", "<leader>u", "<cmd>Undotree<CR>")
vim.keymap.set("n", "<leader>gu", "<cmd>Undotree<CR>")
