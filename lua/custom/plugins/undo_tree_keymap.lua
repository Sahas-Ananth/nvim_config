-- Keyboard remapping for undo tree

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undo tree." })

return {}
