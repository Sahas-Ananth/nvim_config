local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<M-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<M-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<M-Left>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<M-Right>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<M-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<M-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<M-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<M-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<M-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<M-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<M-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<M-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<M-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<M-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<M-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<M-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
-- map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
-- map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
-- map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
-- map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

require('which-key').add {
    { '<M-,>', desc = '[B]buffer Previous' },
    { '<M-.>', desc = '[B]buffer Next' },
    { '<M-1>', hidden = true },
    { '<M-2>', hidden = true },
    { '<M-3>', hidden = true },
    { '<M-4>', hidden = true },
    { '<M-5>', hidden = true },
    { '<M-6>', hidden = true },
    { '<M-7>', hidden = true },
    { '<M-8>', hidden = true },
    { '<M-9>', hidden = true },
    { '<M-0>', hidden = true },
}

return {}
