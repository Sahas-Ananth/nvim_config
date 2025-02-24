-- Python specific keybinds

vim.keymap.set('n', '<leader>fr', '<cmd>w<cr><cmd>term python %<cr>', { noremap = true, silent = true, desc = 'Write, source, and run this file' })
