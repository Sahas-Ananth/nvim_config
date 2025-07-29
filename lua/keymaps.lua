-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.diagnostic.config {
    float = {
        source = 'always',
        border = 'single',
    },
}
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.hl.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- Move selected line / block of text in visual mode.
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { --[[ desc = 'Move selected line / block of text Down in Visual/Visual Line mode.' ]]
})
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { --[[ desc = 'Move selected line / block of text Up in Visual/Visual Line mode.']]
})

-- Append to end of line in normal mode but keep cursor in place.
vim.keymap.set('n', 'J', 'mzJ`z', {
    silent = true, --[[{ desc = 'Append next line to end of line in normal mode but keep cursor in place.' }]]
})

-- During vertical half page jump keep cursor in the middle of the screen.
vim.keymap.set('n', '<C-d>', '<C-d>zz', {
    silent = true, --[[{ desc = 'During vertical half page jump down keep cursor in the middle of the screen.' }]]
})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {
    silent = true, --[[{ desc = 'During vertical half page jump up keep cursor in the middle of the screen.' }]]
})

-- When searching, keep cursor in the middle of the screen.
vim.keymap.set('n', 'n', 'nzz', {
    silent = true, --[[{ desc = 'When searching forwards keep the cursor in the middle.' }]]
})
vim.keymap.set('n', 'N', 'Nzz', {
    silent = true, --[[{ desc = 'When searching backwards keep the cursor in the middle.' }]]
})

-- When pasting over selected text, replace it and do not copy it to the yank register.
-- vim.keymap.set("x", "<leader>p", [["_dP]]) -- Original from thePrimeagen.
vim.keymap.set('v', 'p', [["_dP]], {
    silent = true, --[[{ desc = 'Paste over selected text.' }]]
})
vim.keymap.set('n', 'd', [["_d]], {
    silent = true, --[[{ desc = 'Delete to Black Hole register.' }]]
})

-- Remap signature help to M-k as C-k is taken by kitty and nvim window nav.
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { silent = true, nowait = true, noremap = true })

-- Better window Navigation
vim.keymap.set('n', '<M-s>', '<C-w>s', { nowait = true, noremap = true, silent = true, desc = 'HSplit window.' })
vim.keymap.set('n', '<M-v>', '<C-w>v', { nowait = true, noremap = true, silent = true, desc = 'VSplit window.' })
vim.keymap.set('n', '<M-q>', '<C-w>q', { nowait = true, noremap = true, silent = true, desc = 'Quit a window.' })
vim.keymap.set('n', '<M-x>', '<C-w>x', { nowait = true, noremap = true, silent = true, desc = 'Swap windows.' })
vim.keymap.set('n', '<M-o>', '<C-w>o', { nowait = true, noremap = true, silent = true, desc = 'Close all windows except current.' })

-- Better buffer Navigation
-- vim.keymap.set('n', '<M-c>', '<cmd>bd<cr>', { noremap = true, silent = true, nowait = true, desc = 'Delete Buffer.' })
-- vim.keymap.set('n', '<M-C>', '<cmd>bd!<cr>', { noremap = true, silent = true, nowait = true, desc = 'Delete Buffer without saving.' })
vim.keymap.set('n', '<M-p>', '<cmd>bp<cr>', { noremap = true, silent = true, nowait = true, desc = 'Previous Buffer.' })
vim.keymap.set('n', '<M-n>', '<cmd>bn<cr>', { noremap = true, silent = true, nowait = true, desc = 'Next Buffer.' })
vim.keymap.set('n', '<M-N>', '<cmd>enew<cr>', { nowait = true, noremap = true, silent = true, desc = 'New file.' })

-- Make current file executable.
vim.keymap.set('n', '<leader><leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make current file executable.' })

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { noremap = true, silent = true, desc = 'Resize: Up.' })
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { noremap = true, silent = true, desc = 'Resize: Down.' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true, desc = 'Resize: Left.' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true, desc = 'Resize: Right.' })
