local window_resize_group = vim.api.nvim_create_augroup('WindowResize', { clear = true })

local function is_window_maximized()
    local current_win = vim.api.nvim_get_current_win()
    local win_width = vim.api.nvim_win_get_width(current_win)
    local total_width = vim.o.columns

    return (win_width / total_width) > 0.95
end

local function equalize_windows()
    if #vim.api.nvim_tabpage_list_wins(0) > 1 then
        if not is_window_maximized() then
            vim.cmd('wincmd =')
        end
    end
end

vim.api.nvim_create_autocmd('VimResized', {
    group = window_resize_group,
    callback = equalize_windows,
    desc = 'Equalize window sizes when terminal is resized'
})
