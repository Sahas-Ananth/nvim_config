-- Only do this when not done yet for this buffer
if vim.b.did_ftplugin then
    return
end

-- Behaves just like C
vim.cmd [[runtime! after/ftplugin/c.lua after/ftplugin/c/*.lua]]
vim.keymap.set('n', '<leader>cm', '<cmd>Make!<cr>', { noremap = true, buffer = true, silent = true, desc = '[C]ode [M]ake' })
vim.keymap.set('n', '<leader>cC', '<cmd>!rm -rf build<cr><cmd>Make!<cr>', { noremap = true, buffer = true, silent = true, desc = '[C]ode [C]lean Make' })
