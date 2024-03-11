local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pp', builtin.resume)

vim.keymap.set('n', '<leader>pa', builtin.find_files)
vim.keymap.set('n', '<C-p>', builtin.git_files)
vim.keymap.set('n', '<leader>pg', builtin.git_commits)
vim.keymap.set('n', '<leader>pr', builtin.live_grep)

vim.keymap.set('n', '<leader>ps', function()
    local search = vim.fn.input("Grep > ")
    if search ~= "" then builtin.grep_string({ search = search }); end
end)

vim.keymap.set('n', '<leader>pca', function()
    local cwd = vim.fn.expand('%:p:h')
    builtin.find_files({ cwd = cwd })
end)
vim.keymap.set('n', '<leader>pcr', function()
    local cwd = vim.fn.expand('%:p:h')
    builtin.live_grep({ cwd = cwd })
end)
vim.keymap.set('n', '<leader>pcs', function()
    local search = vim.fn.input("Grep > ")
    local cwd = vim.fn.expand('%:p:h')
    if search ~= "" then builtin.grep_string({ search = search, cwd = cwd }); end
end)
