local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pa', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    local search = vim.fn.input("Grep > ")
    if search ~= "" then builtin.grep_string({ search = search }); end
end)
