require('gitlinker').setup()

vim.keymap.set({ 'n', 'v' }, '<leader>gy', '<cmd>GitLink<CR>')
