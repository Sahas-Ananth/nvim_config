-- Custom keymaps for neovim.

vim.keymap.set("n", "<C-b>", ":Neotree toggle reveal<CR>",
    { noremap = true, silent = true, desc = "Toggle Neotree reveal." })

-- Move selected line / block of text in visual mode.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv",
    { desc = "Move selected line / block of text Down in Visual/Visual Line mode." })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv",
    { desc = "Move selected line / block of text Up in Visual/Visual Line mode." })

-- Append to end of line in normal mode but keep cursor in place.
vim.keymap.set("n", "J", "mzJ`z", { desc = "Append to end of line in normal mode but keep cursor in place." })

-- During vertical half page jump keep cursor in the middle of the screen.
vim.keymap.set("n", "<C-d>", "<C-d>zz",
    { desc = "During vertical half page jump down keep cursor in the middle of the screen." })
vim.keymap.set("n", "<C-u>", "<C-u>zz",
    { desc = "During vertical half page jump up keep cursor in the middle of the screen." })

-- When searching, keep cursor in the middle of the screen.
vim.keymap.set("n", "n", "nzzzv", { desc = "When searching forwards keep the cursor in the middle." })
vim.keymap.set("n", "N", "Nzzzv", { desc = "When searching backwords keep the cursor in the middle." })

-- When pasting over selected text, replace it and do not copy it to the yank register.
-- vim.keymap.set("x", "<leader>p", [["_dP]]) -- Original from thePrimeagen.
vim.keymap.set("v", "p", [["_dP]], { desc = "Paste over selected text." })
vim.keymap.set("n", "d", [["_d]], { desc = "Delete to Black Hole register." })

-- Search for the word under the cursor and replace it.
vim.keymap.set("n", "<leader>fs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Search and replace word under the cursor." })
-- Make current file executable.
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable." })

-- Uncomment after checking no conflicts with other keymaps tomorrow. [x] Tested but doesn't seem useful.
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
--
-- Finally, Add options and keymaps from this guy:
-- https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&ab_channel=chris%40machine

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Go to the Left window." })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Go to the Down window." })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Go to the Up window." })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Go to the Right window." })

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { noremap = true, silent = true, desc = "Resize: Up." })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { noremap = true, silent = true, desc = "Resize: Down." })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true, desc = "Resize: Left." })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true, desc = "Resize: Right." })

-- Format the whole file.
vim.keymap.set("n", "<leader>ff", "Format<CR>", { desc = "Format file." })

-- Refactor keymaps.
-- TODO: Find difference between this:
-- vim.keymap.set("x", "<leader>re", ":Refactor extract ")
-- vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
--
-- vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
--
-- vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
--
-- vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
-- vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

-- and this:
-- vim.keymap.set("x", "<leader>re", function() require('refactoring').refactor('Extract Function') end)
vim.keymap.set("x", "<leader>rf", function() require('refactoring').refactor('Extract Function To File') end, {
    desc = "Extract Function To File",
})
-- Extract function supports only visual mode
vim.keymap.set("x", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end, {
    desc = "Extract Variable",
})
-- Extract variable supports only visual mode
vim.keymap.set({ "n", "x" }, "<leader>ri", function() require('refactoring').refactor('Inline Variable') end, {
    desc = "Inline Variable",
})
-- Inline var supports both normal and visual mode

vim.keymap.set("n", "<leader>rb", function() require('refactoring').refactor('Extract Block') end,
    { desc = "Extract Block" })
vim.keymap.set("n", "<leader>rbf", function() require('refactoring').refactor('Extract Block To File') end,
    { desc = "Extract Block To File" })
-- Extract block supports only normal mode

return {}
