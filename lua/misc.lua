-- Add ROS MESSAGE as filetype
vim.filetype.add {
    extension = {
        msg = 'rosmsg',
        srv = 'rossrv',
        action = 'rosaction',
    },
}

---------------------------------------------------------------------------------------------------------------------

-- Remove an item from the quickfix list with `dd`
local function remove_qf_item()
    local curqfidx = vim.fn.line '.'
    local qfall = vim.fn.getqflist()

    -- Return if there are no items
    if #qfall == 0 then
        return
    end

    -- Remove current entry (Lua tables are 1-indexed)
    table.remove(qfall, curqfidx)
    vim.fn.setqflist(qfall, 'r')

    -- Reopen to refresh
    vim.cmd 'copen'

    -- Move cursor to correct position (avoid overshoot)
    local new_idx = math.min(curqfidx, #qfall)
    local winid = vim.fn.win_getid()
    vim.api.nvim_win_set_cursor(winid, { math.max(new_idx, 1), 0 })
end

vim.api.nvim_create_user_command('RemoveQFItem', remove_qf_item, {})

-- Map `dd` in quickfix window only
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'qf',
    callback = function()
        vim.keymap.set('n', 'dd', ':RemoveQFItem<CR>', { buffer = true, silent = true })
    end,
})
