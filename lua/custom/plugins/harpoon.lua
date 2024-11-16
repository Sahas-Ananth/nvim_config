-- Plugin that makes file navigation easier.

require('which-key').add {
    { '<leader>m', group = 'Harpoon' },
    { '<leader>1', hidden = true },
    { '<leader>2', hidden = true },
    { '<leader>3', hidden = true },
    { '<leader>4', hidden = true },
    { '<leader>5', hidden = true },
    { '<leader>6', hidden = true },
    { '<leader>7', hidden = true },
    { '<leader>8', hidden = true },
    { '<leader>9', hidden = true },
}

--- @type LazyPlugin
return {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    branch = 'harpoon2',
    opts = {
        settings = {
            save_on_toggle = true,
        },
    },
    config = function(_, opts)
        local harpoon = require 'harpoon'
        harpoon:setup(opts)
        harpoon:extend {
            UI_CREATE = function(cx)
                vim.keymap.set('n', '<C-v>', function()
                    harpoon.ui:select_menu_item { vsplit = true }
                end, { buffer = cx.bufnr })

                vim.keymap.set('n', '<C-x>', function()
                    harpoon.ui:select_menu_item { split = true }
                end, { buffer = cx.bufnr })

                vim.keymap.set('n', '<C-t>', function()
                    harpoon.ui:select_menu_item { tabedit = true }
                end, { buffer = cx.bufnr })
            end,
        }
    end,
    keys = function()
        --- @type LazyKeys
        local keys = {
            {
                '<leader>ma',
                function()
                    require('harpoon'):list():add()
                end,
                desc = 'Harpoon Add',
            },
            {
                '<leader>mm',
                function()
                    require('harpoon').ui:toggle_quick_menu(require('harpoon'):list(), {
                        title_pos = 'center',
                        ui_max_width = 50,
                    })
                end,
                desc = 'Harpoon Menu',
            },
            {
                '<leader>mn',
                function()
                    require('harpoon'):list():next()
                end,
                desc = 'Harpoon Next',
            },
            {
                '<leader>mp',
                function()
                    require('harpoon'):list():prev()
                end,
                desc = 'Harpoon Previous',
            },
            {
                '<leader>mt',
                '<cmd>Telescope harpoon marks<cr>',
                desc = 'Harpoon Telescope',
            },
        }
        for i = 1, 9 do
            table.insert(keys, {
                '<leader>' .. i,
                function()
                    require('harpoon'):list():select(i)
                end,
            })
        end
        return keys
    end,
}
