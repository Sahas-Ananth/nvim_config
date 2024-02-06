-- Vim sets to make life easier.

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false

-- Create undo directory in home directory if it doesn't exist.
-- if undo dir doesn't exist, create it
if vim.fn.isdirectory(os.getenv("HOME") .. "/.nvim/undo_dir") == 0 then
    vim.fn.mkdir(os.getenv("HOME") .. "/.nvim/undo_dir", "p")
end

vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undo_dir"
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Tbh I don't know what this does, but it's in thePrimeagen's config. :shrug:
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "80"

-- chris@machine's config.
vim.opt.showtabline = 2    -- always show tabs
vim.opt.smartcase = true   -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true  -- force all horizontal splits to go below current window
vim.opt.splitright = true  -- force all vertical splits to go to the right of current window

return {}
