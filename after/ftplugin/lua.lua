-- Lua specific keymap
-- Keymap to source and run this current lua file in neovim
vim.keymap.set('n', '<leader>fr', '<cmd>w<cr><cmd>source %<cr>', { noremap = true, silent = true, desc = 'Write, source, and run this file' })
