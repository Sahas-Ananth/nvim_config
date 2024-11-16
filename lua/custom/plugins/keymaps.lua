-- Custom keymaps for neovim.

-- vim.keymap.set('n', '<M-b>', ':Neotree toggle reveal<CR>',
--     { noremap = true, silent = true, desc = 'Toggle Neotree reveal.' })

-- Move selected line / block of text in visual mode.
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected line / block of text Down in Visual/Visual Line mode.' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected line / block of text Up in Visual/Visual Line mode.' })

-- Append to end of line in normal mode but keep cursor in place.
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Append next line to end of line in normal mode but keep cursor in place.' })
-- vim.keymap.set('n', 'K', 'mzK`z',
--     { desc = 'Append previous line to end of line in normal mode but keep cursor in place.' })

-- During vertical half page jump keep cursor in the middle of the screen.
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'During vertical half page jump down keep cursor in the middle of the screen.' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'During vertical half page jump up keep cursor in the middle of the screen.' })

-- When searching, keep cursor in the middle of the screen.
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'When searching forwards keep the cursor in the middle.' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'When searching backwards keep the cursor in the middle.' })

-- When pasting over selected text, replace it and do not copy it to the yank register.
-- vim.keymap.set("x", "<leader>p", [["_dP]]) -- Original from thePrimeagen.
vim.keymap.set('v', 'p', [["_dP]], { desc = 'Paste over selected text.' })
vim.keymap.set('n', 'd', [["_d]], { desc = 'Delete to Black Hole register.' })

-- Search for the word under the cursor and replace it.
vim.keymap.set('n', '<leader>fs', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Search and replace word under the cursor.' })
-- Make current file executable.
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make current file executable.' })

-- Uncomment after checking no conflicts with other keymaps tomorrow. [x] Tested but doesn't seem useful.
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
--
-- Finally, Add options and keymaps from this guy:
-- https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&ab_channel=chris%40machine

-- Better window navigation
vim.keymap.set('n', '<M-h>', '<C-w>h', { noremap = true, silent = true, desc = 'Go to the Left window.' })
vim.keymap.set('n', '<M-j>', '<C-w>j', { noremap = true, silent = true, desc = 'Go to the Down window.' })
vim.keymap.set('n', '<M-k>', '<C-w>k', { noremap = true, silent = true, desc = 'Go to the Up window.' })
vim.keymap.set('n', '<M-l>', '<C-w>l', { noremap = true, silent = true, desc = 'Go to the Right window.' })
vim.keymap.set('n', '<M-s>', '<C-w>s', { noremap = true, silent = true, desc = 'HSplit window.' })
vim.keymap.set('n', '<M-v>', '<C-w>v', { noremap = true, silent = true, desc = 'VSplit window.' })
vim.keymap.set('n', '<M-q>', '<C-w>q', { noremap = true, silent = true, desc = 'Quit a window.' })
vim.keymap.set('n', '<M-x>', '<C-w>x', { noremap = true, silent = true, desc = 'Swap windows.' })
vim.keymap.set('n', '<M-o>', '<C-w>o', { noremap = true, silent = true, desc = 'Close all windows except current.' })
vim.keymap.set('n', '<M-n>', '<cmd>enew<cr>', { noremap = true, silent = true, desc = 'New file.' })

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { noremap = true, silent = true, desc = 'Resize: Up.' })
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { noremap = true, silent = true, desc = 'Resize: Down.' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true, desc = 'Resize: Left.' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true, desc = 'Resize: Right.' })

-- Format the whole file.
vim.keymap.set('n', '<leader>ff', 'Format<CR>', { desc = 'Format file.' })

-- Keymap to source and run this current lua file
vim.keymap.set('n', '<leader>fr', '<cmd>w<cr><cmd>source %<cr>', { noremap = true, silent = true, desc = 'Source and run this file.' })

-- Make TS movements and F, f, t, T movements repeatable.
local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })

return {}
