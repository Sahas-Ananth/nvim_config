--- @type LazySpec
return {
    -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = { 'VeryLazy' },
    opts = {
        layout = {
            width = { min = 1 },
            spacing = 1,
        },
        keys = {
            scroll_down = '<c-n>',
            scroll_up = '<c-p>',
        },
        icons = {
            mappings = vim.g.have_nerd_font,
            keys = {
                C = 'C-',
                M = 'M-',
            },
        },
        spec = {
            { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
            { '<leader>d', group = '[D]ebug' },
            { '<leader>r', group = '[R]efactor' },
            { '<leader>s', group = '[S]earch' },
            { '<leader>w', group = '[W]orkspace' },
            { '<leader>t', group = '[T]oggle' },
            { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
            -- Vimtex
            { '<leader>l', group = 'Vimtex' },
            { '<leader>ll', desc = 'Compi[l]e' },
            { '<leader>lL', desc = 'Compile Se[L]ected' },
            { '<leader>li', desc = '[i]nfo' },
            { '<leader>lI', desc = '[I]nfo full' },
            { '<leader>lt', desc = '[t]OC' },
            { '<leader>lT', desc = '[T]oggle TOC' },
            { '<leader>lq', desc = '[l]og' },
            { '<leader>lv', desc = '[v]iew' },
            { '<leader>lr', desc = '[r]everse search' },
            { '<leader>lk', desc = '[k]ill' },
            { '<leader>lK', desc = '[K]ill all' },
            { '<leader>le', desc = '[e]rrors' },
            { '<leader>lo', desc = 'Compile [O]utput' },
            { '<leader>lg', desc = 'Status' },
            { '<leader>lG', desc = 'Full Status' },
            { '<leader>lc', desc = '[c]lean' },
            { '<leader>lC', desc = 'Full [C]lean' },
            { '<leader>lx', desc = 'Reload' },
            { '<leader>lX', desc = 'Reload State' },
            { '<leader>lm', desc = 'Insert [m]aps list' },
            { '<leader>ls', desc = 'Toggle main' },
            { '<leader>la', desc = 'Context menu' },
            -- Code Annotate
            { '<leader>n', group = '[N]ote' },
            -- Harpoon
            { '<leader>m', group = 'Harpoon' },
            { '<C-1>', hidden = true },
            { '<C-2>', hidden = true },
            { '<C-3>', hidden = true },
            { '<C-4>', hidden = true },
            { '<C-5>', hidden = true },
            { '<C-6>', hidden = true },
            { '<C-7>', hidden = true },
            { '<C-8>', hidden = true },
            { '<C-9>', hidden = true },
        },
    },
}
